
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'device_type.dart';

class DeviceBloc extends Cubit<DeviceType> {

  DeviceBloc(super.initialState);

  bool get isMobile => state == DeviceType.mobile;
  bool get isTablet => state == DeviceType.tablet;
  bool get isDesktop => state == DeviceType.desktop;

  void update(BuildContext buildContext){
    emit(_getDeviceType(buildContext));
  }

  static DeviceType _getDeviceType(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return DeviceType.mobile;
    }
    if (screenWidth < 900) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }
}