enum Ingredient {
  cheese,
  olives,
  salami,
  capsicum,
  onion,
  mushroom,
  anchovy,
  pineapple,
  garlic,
  pesto,
}

enum PizzaSize {
  small, medium, large,
}

enum PizzaType {
  margherita(
    ingredients: [Ingredient.cheese],
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyBW_qmYUCcGWkqMrXudZh3umjob0Qjz92g&usqp=CAU',
  ),
  godFather(
    ingredients: [Ingredient.garlic, Ingredient.pesto],
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyBW_qmYUCcGWkqMrXudZh3umjob0Qjz92g&usqp=CAU',
  ),
  vegetarian(
    ingredients: [Ingredient.onion, Ingredient.mushroom, Ingredient.olives],
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyBW_qmYUCcGWkqMrXudZh3umjob0Qjz92g&usqp=CAU',
  ),
  seafood(
    ingredients: [Ingredient.anchovy, Ingredient.onion],
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyBW_qmYUCcGWkqMrXudZh3umjob0Qjz92g&usqp=CAU',
  ),
  salami(
    ingredients: [Ingredient.onion, Ingredient.salami, Ingredient.cheese],
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyBW_qmYUCcGWkqMrXudZh3umjob0Qjz92g&usqp=CAU',
  );
  final List<Ingredient> ingredients;
  final String image;

  const PizzaType({
    required this.ingredients,
    required this.image,
  });
}

enum OrderStatus {
  createOrder,
  customerDetails,
  paymentDetails,
  paymentInProgress,
  paymentSucceeded,
  paymentFailed,
}