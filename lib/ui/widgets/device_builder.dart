
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/device/device_bloc.dart';

class DeviceBuilder extends StatelessWidget {

  final WidgetBuilder? mobile;
  final WidgetBuilder? desktop;

  const DeviceBuilder({super.key, this.mobile, this.desktop});

  @override
  Widget build(BuildContext context) {
    if (context.watch<DeviceBloc>().isDesktop) {
      return desktop != null ? desktop!(context) : const SizedBox();
    }
    return mobile != null ? mobile!(context) : const SizedBox();
  }

}