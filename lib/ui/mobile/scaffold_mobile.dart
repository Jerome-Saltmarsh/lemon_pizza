
import 'package:flutter/material.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/common/widgets/toggles/theme_mode_toggle.dart';
import 'package:lemon_pizza/ui/desktop/ui/utils/format_dollars.dart';
import 'package:lemon_pizza/ui/desktop/ui/widgets/checkout_icon.dart';
import 'package:lemon_pizza/ui/desktop/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class ScaffoldMobile extends StatelessWidget {
  const ScaffoldMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final fontSize = context.fontSize;
    final orderRepository = context.orderRepository;

    return Scaffold(
       appBar: AppBar(
         backgroundColor: colorScheme.primary,
         title: Text("PIZZA MOBILE", style: TextStyle(color: colorScheme.onPrimary, fontSize: context.fontSize.large),),
         actions: const [
           ThemeModeToggle(),
         ],
       ),
       bottomSheet: Text("BOTTOM SHEET"),
       floatingActionButton: OrderBlocBuilder(
         buildWhen: (previous, current){
           return previous.orderItems.length != current.orderItems.length;
         },
         builder: (context, orderState) {
           if (orderState.orderItems.isEmpty) return const SizedBox();
           return const CheckoutIcon();
         }
       ),
       body: SingleChildScrollView(
         child: Column(
           children: PizzaType.values.map((pizzaType){
             final pizzaPrice = orderRepository.getPizzaPrice(pizzaType: pizzaType, pizzaSize: PizzaSize.medium);
             return ListTile(
               title: Text(pizzaType.name, style: TextStyle(fontSize: fontSize.regular, color: colorScheme.secondary),),
               leading: Text(formatDollars(pizzaPrice)),
               subtitle: Text(pizzaType.ingredients.map((e) => e.name).reduce((previousValue, element) => '$previousValue, $element'),
                  style: TextStyle(
                    fontSize: fontSize.small,
                    color: colorScheme.tertiary,
                  ),
               ),
               trailing: TextButton(
                  onPressed: () => context.selectPizzaType(pizzaType),
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                         (Set<MaterialState> states) {
                       return colorScheme.tertiaryContainer; // Default color
                     },
                   ),
                 ),
                  child: Text("ADD", style: TextStyle(color: colorScheme.onTertiaryContainer, fontSize: fontSize.regular),),
               ),
             );
           }).toList(),
         ),
       ),
    );
  }
}