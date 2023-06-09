
import 'package:bloc/bloc.dart';
import 'package:lemon_pizza/blocs/layout/layout_type.dart';

class LayoutBloc extends Cubit<LayoutType> {

  static const mobileScreenWidth = 500.0;

  LayoutBloc(super.initialState);

  void updateScreenWidth(double screenWidth){
    emit(screenWidth < mobileScreenWidth ? LayoutType.mobile : LayoutType.desktop);
  }

  bool get isMobile => state == LayoutType.mobile;
  bool get isDesktop => state == LayoutType.desktop;
}