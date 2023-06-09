
import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/ui/views/order_create_view/create_order_view_desktop.dart';
import 'package:lemon_pizza/ui/views/order_create_view/create_order_view_mobile.dart';
import 'package:lemon_pizza/ui/views/order_create_view/create_order_view_tablet.dart';
import 'package:lemon_pizza/ui/widgets/device_builder.dart';

class CreateOrderView extends StatelessWidget {

  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceBuilder(
        mobile: (context) => const CreateOrderViewMobile(),
        tablet: (context) => const CreateOrderViewTablet(),
        desktop: (context) => const CreateOrderViewDesktop(),
    );
  }
}