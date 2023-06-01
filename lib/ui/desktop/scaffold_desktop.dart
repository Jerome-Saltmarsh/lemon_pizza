import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:lemon_pizza/blocs/theme/theme_bloc.dart';
import 'package:lemon_pizza/ui/common/widgets/texts/text_on_primary.dart';
import 'package:lemon_pizza/ui/desktop/theme/theme_mode_toggle.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'ui/views/order_status_view.dart';
import 'ui/widgets/checkout_icon.dart';
import 'ui/widgets/order_back_button.dart';

class ScaffoldDesktop extends StatelessWidget {
  const ScaffoldDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = context.read<ThemeBloc>().state.fontSize;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.colorScheme.primary,
        title: SizedBox(
          width: 600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "PIZZA NOW",
                style: TextStyle(
                  color: context.colorScheme.onPrimary,
                  fontSize: fontSize.extraLarge,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: const CheckoutIcon(),
              )
            ],
          ),
        ),
        leading: const OrderBackButton(),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                builder: (dialogContext) {
                  return AlertDialog(
                    title: const Text('Pick a color!'),
                    content: ColorPicker(
                      pickerColor: context.read<ThemeBloc>().state.color,
                      onColorChanged: context.read<ThemeBloc>().setColor,
                    ),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(dialogContext);
                      }, child: const Text("CLOSE")
                      )
                    ],
                  );
                },
                context: context,
              );
            },
            child: Text("COLOR", style: TextStyle(color: context.colorScheme.onPrimary),),
          ),
          Container(
              margin: const EdgeInsets.only(right: 8),
              child: const ThemeModeToggle()),
          TextButton(
            onPressed: () => Navigator.of(context).pushNamed('theme'),
            child: TextOnPrimary("THEME", fontSize: fontSize.regular),
          )
        ],
      ),
      body: const OrderStatusView(),
      // floatingActionButton: const OrderStatusFloatingActionButton(),
    );
  }

}