
import 'package:flutter/material.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/common/texts/title_text.dart';
import 'package:lemon_pizza/ui/common/toggles/theme_mode_toggle.dart';
import 'package:lemon_pizza/ui/desktop/utils/format_dollars.dart';
import 'package:lemon_pizza/ui/desktop/widgets/checkout_icon.dart';
import 'package:lemon_pizza/ui/desktop/widgets/order_bloc_builder.dart';
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
         title: const TitleText(),
         actions: const [
           ThemeModeToggle(),
         ],
       ),
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

             final pizzaName = Text(pizzaType.name, style: TextStyle(fontSize: fontSize.large, color: colorScheme.secondary));
             final price = Text(formatDollars(pizzaPrice), style: TextStyle(
               fontSize: fontSize.regular,
               color: colorScheme.onSecondaryContainer,
             ));

             final ingredients = Text(pizzaType.ingredients.map((ingredient) => ingredient.name).reduce((previousValue, element) => '$previousValue, $element'),
               style: TextStyle(
                 fontSize: fontSize.regular,
                 color: colorScheme.tertiary,
               ),
             );

             final addButton = TextButton(
               onPressed: () => context.selectPizzaType(pizzaType),
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                       (Set<MaterialState> states) {
                     return colorScheme.tertiaryContainer; // Default color
                   },
                 ),
               ),
               child: Text("ADD", style: TextStyle(
                   fontFamily: 'CabinSketch',
                   color: colorScheme.onTertiaryContainer, fontSize: fontSize.regular),),
             );

             return ListTile(
               title: price,
               leading: SizedBox(
                   width: 90,
                   child: pizzaName),
               subtitle: ingredients,
               trailing: addButton,
             );
           }).toList(),
         ),
       ),
    );
  }
}