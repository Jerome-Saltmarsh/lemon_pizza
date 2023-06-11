
import 'package:bloc/bloc.dart';

import 'device_type.dart';

class DeviceBloc extends Cubit<DeviceType> {

  DeviceBloc(super.initialState);

  bool get isMobile => state == DeviceType.mobile;
  bool get isTablet => state == DeviceType.tablet;
  bool get isDesktop => state == DeviceType.desktop;

  void update(double width){
    emit(_getDeviceType(width));
  }

  static DeviceType _getDeviceType(double width) {
    if (width < 600) {
      return DeviceType.mobile;
    }
    if (width < 900) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }
}