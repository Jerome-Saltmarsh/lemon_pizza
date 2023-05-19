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
    priceSmall: 5.0,
    priceMedium: 6.5,
    priceLarge: 8.0,
  ),
  godFather(
    ingredients: [Ingredient.garlic, Ingredient.pesto],
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyBW_qmYUCcGWkqMrXudZh3umjob0Qjz92g&usqp=CAU',
    priceSmall: 7.0,
    priceMedium: 8.5,
    priceLarge: 10.0,
  ),
  vegetarian(
    ingredients: [Ingredient.onion, Ingredient.mushroom, Ingredient.olives],
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyBW_qmYUCcGWkqMrXudZh3umjob0Qjz92g&usqp=CAU',
    priceSmall: 5.5,
    priceMedium: 7.0,
    priceLarge: 8.5,
  ),
  seafood(
    ingredients: [Ingredient.anchovy, Ingredient.onion],
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyBW_qmYUCcGWkqMrXudZh3umjob0Qjz92g&usqp=CAU',
    priceSmall: 8.0,
    priceMedium: 10.0,
    priceLarge: 12.5,
  ),
  salami(
    ingredients: [Ingredient.onion, Ingredient.salami, Ingredient.cheese],
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyBW_qmYUCcGWkqMrXudZh3umjob0Qjz92g&usqp=CAU',
    priceSmall: 7.0,
    priceMedium: 8.0,
    priceLarge: 9.0,
  );
  final List<Ingredient> ingredients;
  final String image;
  final double priceSmall;
  final double priceMedium;
  final double priceLarge;

  double getPriceForSize(PizzaSize pizzaSize){
    switch (pizzaSize){
      case PizzaSize.small:
        return priceSmall;
      case PizzaSize.medium:
        return priceMedium;
      case PizzaSize.large:
        return priceLarge;
    }
  }

  const PizzaType({
    required this.ingredients,
    required this.image,
    required this.priceSmall,
    required this.priceMedium,
    required this.priceLarge,
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