
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/theme/theme_bloc.dart';
import 'package:lemon_pizza/blocs/theme/theme_state.dart';

extension BuildContextExtension on BuildContext {
   FontSize get fontSize => read<ThemeBloc>().state.fontSize;
}
