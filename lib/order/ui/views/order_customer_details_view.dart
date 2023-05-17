

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';
import 'package:lemon_pizza/order/ui/widgets/order_invalid_builder.dart';

class CustomerDetailsView extends StatelessWidget {

  CustomerDetailsView({super.key});

  final controllerName = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerPhone = TextEditingController();

  void applyCustomDetails(OrderBloc orderBloc){
    orderBloc.emitOrderState(
       customerDetails: CustomerDetails(
         name: controllerName.text,
         address: controllerAddress.text,
         phone: controllerPhone.text,
       )
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderBloc = context.read<OrderBloc>();
    final customerDetails = orderBloc.state.customerDetails;
    controllerName.text = customerDetails?.name ?? '';
    controllerAddress.text = customerDetails?.address ?? '';
    controllerPhone.text = customerDetails?.phone ?? '';
    onChanged(String value) => applyCustomDetails(orderBloc);

    return OrderValidateBuilder(
        builder: (context, validate) {
        return SizedBox(
          width: 300,
          child: Column(
            children: [
              const Text("CUSTOMER DETAILS"),
              BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, orderState) =>
                      TextField(
                        controller: controllerName,
                        decoration: InputDecoration(
                            label: const Text("Name"),
                            errorText: validate && controllerName.text.isEmpty ? 'required' : null
                        ),
                        onChanged: onChanged,
                      ),
                    buildWhen: (previous, current) =>
                      previous.customerDetails?.name != current.customerDetails?.name,
              ),
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, orderState) =>
                    TextField(
                      controller: controllerAddress,
                      decoration: InputDecoration(
                          label: const Text("Address"),
                          errorText: validate && controllerAddress.text.isEmpty ? 'required' : null
                      ),
                      onChanged: onChanged,
                    ),
                buildWhen: (previous, current) =>
                previous.customerDetails?.address != current.customerDetails?.address,
              ),
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, orderState) =>
                    TextField(
                      controller: controllerPhone,
                      decoration: InputDecoration(
                          label: const Text("Phone"),
                          errorText: validate && controllerPhone.text.isEmpty ? 'required' : null
                      ),
                      onChanged: onChanged,
                    ),
                buildWhen: (previous, current) =>
                previous.customerDetails?.phone != current.customerDetails?.phone,
              ),
            ],
          ),
        );
      }
    );
  }
}