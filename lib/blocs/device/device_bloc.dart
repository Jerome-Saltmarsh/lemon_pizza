
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'device_type.dart';

class DeviceBloc extends Cubit<DeviceType> {

  DeviceBloc(super.initialState);

  bool get isMobile => state == DeviceType.mobile;
  bool get isDesktop => state == DeviceType.desktop;

  void update(BuildContext buildContext){
    emit(getDeviceType(buildContext));
  }

  DeviceType getDeviceType(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return DeviceType.mobile;
    } else if (screenWidth < 1200) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }
}