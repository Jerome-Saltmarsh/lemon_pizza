// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:golden_ratio/constants.dart';
// import 'package:lemon_pizza/blocs/order/order_bloc.dart';
// import 'package:lemon_pizza/blocs/order/order_enums.dart';
// import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
// import 'package:lemon_pizza/ui/common/font_families.dart';
// import 'package:lemon_pizza/ui/common/functions/format_dollars.dart';
// import 'package:lemon_pizza/ui/desktop/images/pizza_image.dart';
// import 'package:lemon_pizza/ui/desktop/widgets/order_bloc_builder.dart';
// import 'package:lemon_widgets/lemon_widgets.dart';
//
// class SelectPizzaSizeDialog extends StatefulWidget {
//   final PizzaType pizzaType;
//
//   const SelectPizzaSizeDialog({super.key, required this.pizzaType});
//
//   @override
//   State<SelectPizzaSizeDialog> createState() => _SelectPizzaSizeDialogState();
// }
//
// class _SelectPizzaSizeDialogState extends State<SelectPizzaSizeDialog> {
//   var selectedPizzaSize = PizzaSize.medium;
//
//   Widget buildPizzaSizeButton(PizzaSize pizzaSize){
//     final themeState = context.readThemeState;
//     final colorScheme = context.colorScheme;
//     final fontSize = context.fontSize;
//     const height = 200.0;
//     final isSelected = selectedPizzaSize == pizzaSize;
//
//     return OnPressed(
//       action: () {
//         setState(() {
//           selectedPizzaSize = pizzaSize;
//         });
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//         height: height,
//         width:  height * goldenRatio_0618,
//         decoration: BoxDecoration(
//           borderRadius: themeState.dialogBorderRadius,
//           color: isSelected ? colorScheme.primary : colorScheme.secondary,
//         ),
//         padding: themeState.dialogPadding,
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(pizzaSize.name.toUpperCase(), style: TextStyle(
//                 fontFamily: 'CabinSketch',
//                 fontSize: fontSize.large,
//                 color: isSelected ? colorScheme.onPrimary : colorScheme.onSecondary
//             )),
//             Text(
//                 formatDollars(context.orderRepository.getPizzaPrice(
//                   pizzaType: widget.pizzaType,
//                   pizzaSize: pizzaSize,
//                 )),
//                 style: TextStyle(
//                     fontSize: fontSize.regular,
//                     color: isSelected ? colorScheme.onPrimary : colorScheme.onSecondary
//                 )
//             ),
//             const SizedBox(height: 8,),
//             Container(
//                 height: 75,
//                 width: 225.0 * getIconSize(pizzaSize) * 0.2,
//                 alignment: Alignment.center,
//                 child: const PizzaImage()
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) =>
//       OrderBlocBuilder(builder: (context, orderState) {
//         final colorScheme = context.colorScheme;
//         final themeState = context.readThemeState;
//         const width = 460.0;
//         const blur = 4.0;
//         return BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               AnimatePosition(
//                 duration: const Duration(milliseconds: 200),
//                 curve: Curves.easeOut,
//                 side: Side.top,
//                 start: 0,
//                 end: 100,
//                 child: Container(
//                   width: width,
//                   height: width * goldenRatio_0618,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: context.colorScheme.surfaceVariant,
//                     borderRadius: themeState.dialogBorderRadius,
//                   ),
//                   padding: themeState.dialogPadding,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       const SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: PizzaSize.values
//                             .map(buildPizzaSizeButton)
//                             .toList(),
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           TextButton(
//                               onPressed: context.read<OrderBloc>().cancelSelectPizza,
//                               child: Text(
//                                 "Cancel", style: TextStyle(
//                                   fontFamily: FontFamilies.secondary,
//                                   color: colorScheme.secondary),)
//                           ),
//                           TextButton(
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.resolveWith<Color?>(
//                                     (Set<MaterialState> states) {
//                                   if (states.contains(MaterialState.disabled)) {
//                                     return Colors.grey; // Color when the button is disabled
//                                   }
//                                   if (states.contains(MaterialState.hovered)){
//                                     return colorScheme.inversePrimary;
//                                   }
//                                   return colorScheme.primary; // Default color
//                                 },
//                               ),
//                             ),
//                             onPressed: (){
//                               context.read<OrderBloc>().addPizza(pizzaType: widget.pizzaType, pizzaSize: selectedPizzaSize);
//                             },
//                             child: Text("CONFIRM", style: TextStyle(
//                                 fontFamily: FontFamilies.secondary,
//                                 color: colorScheme.onPrimary),)
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       });
//
//   double getIconSize(PizzaSize pizzaSize) {
//     switch (pizzaSize) {
//       case PizzaSize.small:
//         return 1.0;
//       case PizzaSize.medium:
//         return goldenRatio_1381;
//       case PizzaSize.large:
//         return goldenRatio_1618;
//     }
//   }
//
// }
//
//
//
