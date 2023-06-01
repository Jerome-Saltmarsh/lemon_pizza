
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/theme/bloc/theme_bloc.dart';
import 'package:lemon_pizza/theme/bloc/theme_state.dart';

extension BuildContextExtension on BuildContext {
   FontSize get fontSize => read<ThemeBloc>().state.fontSize;
}
