

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_state.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class CustomerDetailsView extends StatefulWidget {

  const CustomerDetailsView({super.key});

  @override
  State<CustomerDetailsView> createState() => _CustomerDetailsViewState();
}

class _CustomerDetailsViewState extends State<CustomerDetailsView> {
  final controllerName = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerPhone = TextEditingController();

  String? controllerNameError;
  String? controllerAddressError;
  String? controllerPhoneError;

  @override
  void initState() {
    super.initState();
    final orderBloc = context.read<OrderBloc>();
    final customerDetails = orderBloc.state.customerDetails;
    controllerName.text = customerDetails.name;
    controllerAddress.text = customerDetails.address;
    controllerPhone.text = customerDetails.phone;
  }

  @override
  Widget build(BuildContext context) => Stack(
      alignment: Alignment.center,
      children: [
        AnimatePosition(
          side: Side.top,
          start: 0,
          end: 50,
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("CUSTOMER DETAILS", style: TextStyle(
                    fontFamily: FontFamilies.secondary,
                    fontSize: context.fontSize.large,
                  ),),
                  TextField(
                    controller: controllerName,
                    decoration: InputDecoration(
                        label: const Text("Name"),
                        errorText: controllerNameError
                    ),
                  ),
                  TextField(
                    controller: controllerAddress,
                    decoration: InputDecoration(
                      label: const Text("Address"),
                      errorText: controllerAddressError,
                    ),
                  ),
                  TextField(
                    controller: controllerPhone,
                    decoration: InputDecoration(
                        label: const Text("Phone"),
                        errorText: controllerPhoneError
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(onPressed: () {
                    submit();
                  }, child: Text("NEXT", style: TextStyle(
                    fontSize: context.fontSize.large,
                    fontFamily: FontFamilies.secondary,
                  ),))
                ],
              ),
            ),
          ),
        ),
      ],
    );

  void submit(){
    if (!validate()) {
      setState(() { });
      return;
    }

    context.readOrderBloc.submitCustomerDetails(
        CustomerDetails(
          name: controllerName.text,
          address: controllerAddress.text,
          phone: controllerPhone.text,
        ),
    );
  }

  bool validate() {
    controllerNameError = null;
    controllerAddressError = null;
    controllerPhoneError = null;
    if (controllerName.text.isEmpty){
      controllerNameError = 'name required';
    }
    if (controllerAddress.text.isEmpty){
      controllerAddressError = 'address required';
    }
    if (controllerPhone.text.isEmpty){
      controllerPhoneError = 'phone number required';
    }
    return
        controllerNameError == null &&
        controllerAddressError == null &&
        controllerPhoneError == null
    ;
  }
}