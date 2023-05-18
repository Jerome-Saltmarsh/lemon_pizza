

import 'package:bloc/bloc.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';
import 'package:lemon_pizza/order/data/repositories/order_repository.dart';

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
        orderItems: [...state.orderItems, orderItem]
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
  }){
    emit(OrderState(
      orderItems: orderItems ?? state.orderItems,
      orderStatus: orderStatus ?? state.orderStatus,
      customerDetails: customerDetails ?? state.customerDetails,
      paymentDetails: paymentDetails ?? state.paymentDetails,
      validate: validate ?? state.validate,
    ));
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
          orderStatus: OrderStatus.customerDetails,
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
}
