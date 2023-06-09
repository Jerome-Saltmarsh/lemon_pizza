
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/device/device_bloc.dart';
import 'package:lemon_pizza/blocs/device/device_type.dart';

class DeviceBuilder extends StatelessWidget {

  final WidgetBuilder? mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  const DeviceBuilder({super.key, this.mobile, this.tablet, this.desktop});

  @override
  Widget build(BuildContext context) {
    switch (context.watch<DeviceBloc>().state) {
      case DeviceType.mobile:
        return mobile?.call(context) ?? const SizedBox();
      case DeviceType.tablet:
        return tablet?.call(context) ?? const SizedBox();
      case DeviceType.desktop:
        return desktop?.call(context) ?? const SizedBox();
    }
  }
}