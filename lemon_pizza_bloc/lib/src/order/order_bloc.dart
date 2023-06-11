

import 'package:bloc/bloc.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';

import 'order_repository.dart';
import 'order_state.dart';


class OrderBloc extends Cubit<OrderState> {

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
        ordersPlacedVisible: true,
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

  void setCustomerDetails({
    required String name,
    required String address,
    required String phone,
  }){
    emitOrderState(
       customerDetails: CustomerDetails(
        name: name,
        address: address,
         phone: phone,
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
    bool? ordersPlacedVisible,
    OrderType? orderType,
  }){
    emit(OrderState(
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
    await orderRepository.submitOrder().then((value) {
      emitOrderState(orderStatus: OrderStatus.paymentSucceeded);
    }).catchError((error){
      emitOrderState(orderStatus: OrderStatus.paymentFailed);
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

  String formatDollars(double value)=> '\$${value.toStringAsFixed(2)}';
}
