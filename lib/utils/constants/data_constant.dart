import 'package:food_app_flutter/domain/recipe.dart';

import '../../domain/meal.dart';
import '../../domain/tip.dart';

const data_meal = [
  Meal(
    // id: 'm1',
    name: 'Potato',
    imageUrl: "assets/images/potato.png",
    purchaseDate: "2023-09-01",
    expirationDate: "2023-09-12",
    quantity: "0.25",
    unit: "Kg",
    marketName: "",
    notes: "",
  ),
  Meal(
    //    id: 'm2',
    name: 'Tomato',
    imageUrl: "assets/images/tomato.png",
    purchaseDate: "2023-09-05",
    expirationDate: "2023-09-12",
    quantity: "2",
    unit: "Kg",
    marketName: "",
    notes: "",
  )
];

const data_tip = [
  Tip(
    title: 'Potato',
    details:
        "As a rule of thumb, the best place to store potatoes is in a cool, dry area of your kitchen, with good ventilation and out of direct sunlight. A kitchen cupboard or closet, even the basement or garage, can all the good choices.",
  ),
  Tip(
    title: 'Tomato',
    details:
        "Levy recommends storing ripe tomatoes upside down (stem-side down) on paper towels in an open container such as Tupperware, a shoe box, or a cardboard flat.",
  ),
];

const data_recipe = [
  Recipe(
    imageUrl: "assets/images/meal.png",
    name: 'Caesar Salad',
    ingredients: "Tomato, Pepper, Corn",
    details:
        "A Caesar salad is a green salad of romaine lettuce and croutons dressed with lemon juice, olive oil, egg, Worcestershire sauce, anchovies, garlic, Dijon mustard, Parmesan cheese, and black pepper. In its original form, this salad was prepared and served",
  ),
  Recipe(
    imageUrl: "assets/images/meal.png",
    name: 'Potato',
    ingredients: "Tomato, Pepper, Corn",
    details:
        "As a rule of thumb, the best place to store potatoes is in a cool, dry area of your kitchen, with good ventilation and out of direct sunlight. A kitchen cupboard or closet, even the basement or garage, can all the good choices.",
  ),
  Recipe(
    imageUrl: "assets/images/meal.png",
    name: 'Tomato',
    ingredients: "Tomato, Pepper, Corn",
    details:
        "Levy recommends storing ripe tomatoes upside down (stem-side down) on paper towels in an open container such as Tupperware, a shoe box, or a cardboard flat.",
  ),
];
