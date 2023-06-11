

import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';

String mapIngredientsToString(List<Ingredient> ingredients) =>
    ingredients.map((ingredient) => ingredient.name).reduce((previousValue, element) => '$previousValue, $element');