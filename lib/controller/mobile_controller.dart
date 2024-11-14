import 'package:food_app/model/food_model.dart';
import 'package:get/get.dart';

class MobileController extends GetxController {
  final List<FoodModel> foodmodel = [
  FoodModel(
    name: 'Pizza',
    imgurl: 'assets/image/pizza.png',
    category: 'italian',
    price: 350,
    description: 'A classic Italian pizza topped with fresh mozzarella, tomato sauce, and basil.',
    portionSize: '500g',
    ingredients: 'Flour, tomato sauce, mozzarella, olive oil, basil, yeast'
  ),
  FoodModel(
    name: 'Biriyani',
    imgurl: 'assets/image/biriyani.png',
    category: 'indian',
    price: 150,
    description: 'A flavorful and aromatic rice dish cooked with tender pieces of marinated meat and spices.',
    portionSize: '400g',
    ingredients: 'Basmati rice, chicken/mutton, yogurt, onions, tomatoes, spices'
  ),
  FoodModel(
    name: 'Meals',
    imgurl: 'assets/image/meals.png',
    category: 'indian',
    price: 100,
    description: 'A traditional South Indian meal served with rice, sambar, rasam, and assorted side dishes.',
    portionSize: '600g',
    ingredients: 'Rice, sambar, rasam, vegetables, chutneys, papad'
  ),
  FoodModel(
    name: 'Pasta',
    imgurl: 'assets/image/pasta.png',
    category: 'italian',
    price: 280,
    description: 'Creamy and delicious pasta cooked with a rich Alfredo sauce and topped with Parmesan.',
    portionSize: '350g',
    ingredients: 'Pasta, cream, garlic, Parmesan cheese, olive oil, herbs'
  ),
  FoodModel(
    name: 'Burger',
    imgurl: 'assets/image/burger.png',
    category: 'american',
    price: 170,
    description: 'A juicy beef patty with lettuce, tomato, cheese, and special sauce in a soft bun.',
    portionSize: '250g',
    ingredients: 'Beef patty, lettuce, tomato, cheddar cheese, burger bun, sauce'
  ),
  FoodModel(
    name: 'Sushi',
    imgurl: 'assets/image/sushi.png',
    category: 'japanese',
    price: 400,
    description: 'Freshly prepared sushi rolls with a mix of raw fish, avocado, and seasoned rice.',
    portionSize: '200g',
    ingredients: 'Sushi rice, nori, raw fish, avocado, wasabi, soy sauce'
  ),
  FoodModel(
    name: 'Noodles',
    imgurl: 'assets/image/noodles.png',
    category: 'japanese',
    price: 380,
    description: 'Stir-fried noodles with vegetables and your choice of chicken or tofu in a savory sauce.',
    portionSize: '300g',
    ingredients: 'Noodles, soy sauce, vegetables, chicken/tofu, sesame oil, ginger'
  ),
  FoodModel(
    name: 'Parotta',
    imgurl: 'assets/image/parotta.png',
    category: 'indian',
    price: 12,
    description: 'Flaky, layered flatbread that is a staple of South Indian cuisine, best enjoyed with curry.',
    portionSize: '100g',
    ingredients: 'Flour, water, ghee/oil, salt'
  ),
  FoodModel(
    name: 'Salad',
    imgurl: 'assets/image/salad.png',
    category: 'healthy',
    price: 120,
    description: 'A fresh and healthy salad with mixed greens, cherry tomatoes, cucumber, and a light vinaigrette.',
    portionSize: '150g',
    ingredients: 'Lettuce, cherry tomatoes, cucumber, olive oil, vinegar, salt, pepper'
  ),
  FoodModel(
    name: 'Dim Sum',
    imgurl: 'assets/image/noodles.png',
    category: 'chinese',
    price: 260,
    description: 'Steamed dumplings filled with a savory mixture of pork and vegetables, served with soy sauce.',
    portionSize: '200g',
    ingredients: 'Pork, cabbage, ginger, soy sauce, dumpling wrappers'
  ),
  FoodModel(
    name: 'Fried Fish',
    imgurl: 'assets/image/fishfry.png',
    category: 'indian',
    price: 70,
    description: 'Crispy fried fish coated with a spiced batter, served with lemon wedges.',
    portionSize: '150g',
    ingredients: 'Fish, gram flour, chili powder, turmeric, salt, lemon'
  ),
];

  var filteredmodel = <FoodModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredmodel.value = foodmodel;
  }

  void filtersearch(String val) {
    if (val.isEmpty) {
      filteredmodel.value = foodmodel;
    } else {
      filteredmodel.value = foodmodel
          .where((food) => food.name.toLowerCase().contains(val.toLowerCase()))
          .toList();
    }
  }

  List<String> get categories {
    return foodmodel.map((food) => food.category).toSet().toList();
  }
}
