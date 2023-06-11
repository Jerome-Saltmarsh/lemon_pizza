
import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza_ui/ui/widgets/device_builder.dart';

import 'create_order_view_desktop.dart';
import 'create_order_view_mobile.dart';
import 'create_order_view_tablet.dart';

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