import 'package:bloc/bloc.dart';

class AppObserver extends BlocObserver {
  const AppObserver();

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}