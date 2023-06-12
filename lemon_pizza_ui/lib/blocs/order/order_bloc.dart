

import 'package:bloc/bloc.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/ui/functions/format_dollars.dart';


class OrderBloc extends Cubit<Order> {

  final OrderRepository orderRepository;

  OrderBloc(super.initialState, {required this.orderRepository});

  void setOrderStatus(OrderStatus value) =>
      emit(state.copyWith(orderStatus: value));

  void restart(){
    emitOrderState(
      orderItems: [],
      orderStatus: OrderStatus.createOrder,
    );
  }

  void removeOrderItem(OrderItem orderItem) {
    final orderItems = state.orderItems.where((element) => element != orderItem).toList();
     emitOrderState(
       orderItems: orderItems,
       orderStatus: orderItems.isEmpty ? OrderStatus.createOrder : null,
     );
  }

  void addOrderItem(OrderItem orderItem) {
    if (state.orderStatus != OrderStatus.createOrder) {
      throw Exception('cannot modify order in state ${state.orderStatus}');
    }
    emitOrderState(
        orderItems: [...state.orderItems, orderItem],
    );
  }

  void addPizza({required PizzaType pizzaType, required PizzaSize pizzaSize}){
     addOrderItem(
       OrderItem(
           pizzaType: pizzaType,
           pizzaSize: pizzaSize,
           quantity: 1,
           pricePerPizza: orderRepository.getPizzaPrice(
               pizzaType: pizzaType, pizzaSize: pizzaSize
           ),
       )
     );
  }

  void emitOrderState({
    List<OrderItem>? orderItems,
    OrderStatus? orderStatus,
    CustomerDetails? customerDetails,
    PaymentDetails? paymentDetails,
    OrderType? orderType,
  }){
    emit(Order(
      orderItems: orderItems ?? state.orderItems,
      orderStatus: orderStatus ?? state.orderStatus,
      customerDetails: customerDetails ?? state.customerDetails,
      paymentDetails: paymentDetails ?? state.paymentDetails,
      orderType: orderType ?? state.orderType,
    ));
  }

  void submitCustomerDetails(CustomerDetails customerDetails) {
     emitOrderState(
      customerDetails: customerDetails,
      orderStatus: OrderStatus.paymentDetails,
    );
  }

  void submitPaymentDetails(PaymentDetails paymentDetails) async {
    emitOrderState(
      paymentDetails: paymentDetails,
    );
    submitOrder();
  }

  void submitOrder() async {
    print("submitOrder()");

    final paymentDetails = state.paymentDetails;

    String? cardNumberError;
    String? expiryYearError;
    String? expiryMonthError;
    String? cvvError;

    if (paymentDetails.cardNumber.length < 15){
       cardNumberError = 'Too Short';
    }
    if (paymentDetails.expiryYear.trim().length != 4){
      expiryYearError = 'Invalid';
    }
    final month = int.tryParse(paymentDetails.expiryMonth);
    if (month == null || month < 1 || month > 12) {
      expiryMonthError = 'Invalid';
    }
    final cvv = int.tryParse(paymentDetails.cvv);
    if (cvv == null || cvv.toString().length != 3){
      cvvError = "Invalid";
    }


    if (
        cardNumberError != null ||
        expiryYearError != null ||
        expiryMonthError != null ||
        cvvError != null
    ){
      emitOrderState(
        paymentDetails: state.paymentDetails.copyWith(
          cardNumberError: cardNumberError,
          expiryYearError: expiryYearError,
          expiryMonthError: expiryMonthError,
          cvvError: cvvError,
        )
      );
      return;
    }

    emitOrderState(orderStatus: OrderStatus.paymentInProgress);
    await orderRepository.createOrder(state).then((value) {
      if (value.status == OrderRepositorySubmitResponseStatus.succeeded){
        emitOrderState(orderStatus: OrderStatus.paymentSucceeded);
      } else {
        emitOrderState(orderStatus: OrderStatus.paymentFailed);
      }
    }).catchError((error){
      emitOrderState(orderStatus: OrderStatus.paymentError);
    });


  }

  void back() {
     switch (state.orderStatus) {
       case OrderStatus.reviewOrder:
         emitOrderState(
           orderStatus: OrderStatus.createOrder,
         );
         break;
       case OrderStatus.customerDetails:
         emitOrderState(
           orderStatus: OrderStatus.createOrder,
         );
         break;
       case OrderStatus.paymentDetails:
         emitOrderState(
           orderStatus: OrderStatus.customerDetails,
         );
         break;
       case OrderStatus.paymentFailed:
         emitOrderState(
           orderStatus: OrderStatus.paymentDetails,
         );
         break;
       default:
         break;
     }
  }

  String get formattedTotalCost => formatDollars(state.totalOrderCost);

  void onChangedCardNumber(String cardNumber){
      emit(state.copyWith(
        paymentDetails: state.paymentDetails.copyWith(cardNumber: cardNumber)
      ));
  }

  void onChangedPaymentDetailsExpiryMonth(String value) =>
      emit(state.copyWith(
        paymentDetails: state.paymentDetails.copyWith(expiryMonth: value)
      ));
}
