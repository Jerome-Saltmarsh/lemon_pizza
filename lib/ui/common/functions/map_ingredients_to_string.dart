

import 'package:lemon_pizza/blocs/order/order_enums.dart';

String mapIngredientsToString(List<Ingredient> ingredients) =>
    ingredients.map((ingredient) => ingredient.name).reduce((previousValue, element) => '$previousValue, $element');