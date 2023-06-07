

import 'package:lemon_pizza/model/pizza_ingredient.dart';

String mapIngredientsToString(List<Ingredient> ingredients) =>
    ingredients.map((ingredient) => ingredient.name).reduce((previousValue, element) => '$previousValue, $element');