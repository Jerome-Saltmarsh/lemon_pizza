
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:lemon_pizza/blocs/theme/theme_bloc.dart';

class ThemeHueSlider extends StatelessWidget {

  const ThemeHueSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();
    return SizedBox(
      width: 200,
      child: ColorPickerSlider(
        TrackType.hue,
        HSVColor.fromColor(themeBloc.state.color),
            (HSVColor color) {
              themeBloc.setColor(color.toColor());
        },
        displayThumbColor: true,
      ),
    );
  }
}