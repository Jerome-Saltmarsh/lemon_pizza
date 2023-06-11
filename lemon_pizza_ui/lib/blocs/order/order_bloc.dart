

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
      validate: false,
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

  void emitPaymentDetails({
    String? cardHolderName,
    String? cardNumber,
    String? expiryYear,
    String? expiryMonth,
    String? cvv,
  }){
    final paymentDetails = state.paymentDetails;
    emitOrderState(
      paymentDetails: PaymentDetails(
        cardNumber: cardNumber ?? paymentDetails.cardNumber,
        expiryYear: expiryYear ?? paymentDetails.expiryYear,
        expiryMonth: expiryMonth ?? paymentDetails.expiryMonth,
        cvv: cvv ?? paymentDetails.cvv,
      )
    );
  }

  void emitOrderState({
    List<OrderItem>? orderItems,
    OrderStatus? orderStatus,
    CustomerDetails? customerDetails,
    PaymentDetails? paymentDetails,
    bool? validate,
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
           validate: false,
         );
         break;
       case OrderStatus.customerDetails:
         emitOrderState(
           orderStatus: OrderStatus.createOrder,
           validate: false,
         );
         break;
       case OrderStatus.paymentDetails:
         emitOrderState(
           orderStatus: OrderStatus.customerDetails,
           validate: false,
         );
         break;
       case OrderStatus.paymentFailed:
         emitOrderState(
           orderStatus: OrderStatus.paymentDetails,
           validate: false,
         );
         break;
       default:
         break;
     }
  }

  String get formattedTotalCost => formatDollars(state.totalOrderCost);
}
