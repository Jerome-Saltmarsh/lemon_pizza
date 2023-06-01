
import 'package:flutter/material.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/desktop/theme/theme_mode_toggle.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class ScaffoldMobile extends StatelessWidget {
  const ScaffoldMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final fontSize = context.fontSize;
    return Scaffold(
       appBar: AppBar(
         backgroundColor: colorScheme.primary,
         title: Text("PIZZA MOBILE", style: TextStyle(color: colorScheme.onPrimary, fontSize: context.fontSize.large),),
         actions: const [
           ThemeModeToggle(),
         ],
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: () {

         },
         child: const Icon(Icons.arrow_forward),
       ),
       body: SingleChildScrollView(
         child: Column(
           children: PizzaType.values.map((e){
             return ListTile(
               title: Text(e.name, style: TextStyle(fontSize: fontSize.regular, color: colorScheme.secondary),),
               subtitle: Text(e.ingredients.map((e) => e.name).reduce((previousValue, element) => '$previousValue, $element'),
                  style: TextStyle(
                    fontSize: fontSize.small,
                    color: colorScheme.tertiary,
                  ),
               ),
               trailing: TextButton(
                  onPressed: () {

                  },
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                         (Set<MaterialState> states) {
                       return colorScheme.primary; // Default color
                     },
                   ),
                 ),
                  child: Text("ADD", style: TextStyle(color: colorScheme.onPrimary, fontSize: fontSize.regular),),
               ),
             );
           }).toList(),
         ),
       ),
    );
  }
}