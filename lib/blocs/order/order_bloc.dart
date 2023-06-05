

import 'package:bloc/bloc.dart';
import 'package:lemon_pizza/blocs/order/order_repository.dart';
import 'package:lemon_pizza/ui/common/functions/format_dollars.dart';

import 'order_enums.dart';
import 'order_state.dart';


class OrderBloc extends Cubit<OrderState> {

  final OrderRepository orderRepository;

  OrderBloc(super.initialState, {required this.orderRepository});

  void restart(){
    emitOrderState(
      orderItems: [],
      orderStatus: OrderStatus.createOrder,
      validate: false,
    );
  }

  void removeOrderItem(OrderItem orderItem) {
     emitOrderState(
       orderItems: state.orderItems.where((element) => element != orderItem).toList()
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
    int? expiryYear,
    int? expiryMonth,
    int? cvv,
  }){
    final paymentDetails = state.paymentDetails;
    emitOrderState(
      paymentDetails: PaymentDetails(
        cardHolderName: cardHolderName ?? paymentDetails.cardHolderName,
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

  void next() async {
    switch (state.orderStatus) {
      case OrderStatus.createOrder:
        if (state.orderItems.isEmpty) {
          emitOrderState(validate: true);
          return;
        }
        emitOrderState(
          orderStatus: OrderStatus.orderType,
          validate: false,
        );
        break;
      case OrderStatus.customerDetails:
        final customerDetails = state.customerDetails;
        if (!customerDetails.valid) {
          emitOrderState(validate: true);
          return;
        }
        emitOrderState(
            orderStatus: OrderStatus.paymentDetails,
            validate: false,
        );
        break;
      case OrderStatus.paymentDetails:
        if (!state.paymentDetails.valid) {
          emitOrderState(validate: true);
          return;
        }
        if (!state.orderCompleted){
          emitOrderState(
              orderStatus: OrderStatus.createOrder,
              validate: true,
          );
          return;
        }
        if (!state.customerDetails.valid){
          emitOrderState(
            orderStatus: OrderStatus.customerDetails,
            validate: true,
          );
          return;
        }

        emitOrderState(
            orderStatus: OrderStatus.paymentInProgress,
            validate: false,
        );
        await orderRepository.submitOrder().then((value) {
          emitOrderState(orderStatus: OrderStatus.paymentSucceeded);
        }).catchError((error){
          emitOrderState(orderStatus: OrderStatus.paymentFailed);
        });
        break;
      case OrderStatus.paymentFailed:
        emitOrderState(orderStatus: OrderStatus.paymentDetails);
        break;
      case OrderStatus.paymentSucceeded:
        restart();
        break;
      default:
        break;
    }
  }

  OrderStatus get nextOrderStatus {
    switch (state.orderStatus) {
      case OrderStatus.createOrder:
        return OrderStatus.orderType;
      case OrderStatus.orderType:
        return OrderStatus.customerDetails;
      case OrderStatus.customerDetails:
        return OrderStatus.paymentDetails;
      case OrderStatus.paymentDetails:
        return OrderStatus.paymentInProgress;
      case OrderStatus.paymentFailed:
        return OrderStatus.paymentDetails;
      case OrderStatus.paymentSucceeded:
        return OrderStatus.createOrder;
      case OrderStatus.paymentInProgress:
        return OrderStatus.paymentInProgress;
    }
  }

  String get formattedTotalCost => formatDollars(state.totalOrderCost);
}
