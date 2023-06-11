

import 'package:lemon_pizza_model/lemon_pizza_model.dart';

String mapIngredientsToString(List<Ingredient> ingredients) =>
    ingredients.map((ingredient) => ingredient.name).reduce((previousValue, element) => '$previousValue, $element');