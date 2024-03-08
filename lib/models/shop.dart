import 'package:flutter/material.dart';
import 'package:japan_restaurant/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    //bento
    Food(
        name: "Bento",
        price: "30.000",
        imagePath: "lib/images/bento.png",
        rating: "4,9",
        desc:
            "Bento is a single-portion take-out or home-packed meal common in Japanese cuisine. A traditional bento holds rice or noodles, fish or meat, with pickled and cooked vegetables, in a box."),

    //dorayaki
    Food(
        name: "Dorayaki",
        price: "25.000",
        imagePath: "lib/images/dorayaki.png",
        rating: "4,9",
        desc:
            "Dorayaki is a type of Japanese confection, a red-bean pancake which consists of two small pancake-like patties made from castella wrapped around a filling of sweet Azuki red bean paste."),

    //omurice
    Food(
        name: "Omurice",
        price: "20.000",
        imagePath: "lib/images/omurice.png",
        rating: "4,8",
        desc:
            "Omurice is a contemporary Japanese fusion creation consisting of an omelette made with fried rice and usually topped with ketchup."),

    //onigiri
    Food(
        name: "Onigiri",
        price: "10.000",
        imagePath: "lib/images/onigiri.png",
        rating: "4,6",
        desc:
            "Onigiri, also known as omusubi, is a Japanese rice ball made from white rice formed into triangular or cylindrical shapes and often wrapped in nori."),

    //ramen
    Food(
        name: "Ramen",
        price: "40.000",
        imagePath: "lib/images/ramen.png",
        rating: "4,9",
        desc:
            "Ramen is a Japanese noodle soup. It consists of Chinese wheat noodles served in a meat or fish-based broth, often flavored with soy sauce or miso, and uses toppings such as sliced pork"),

    //sukiyaki
    Food(
        name: "Sukiyaki",
        price: "27.000",
        imagePath: "lib/images/sukiyaki.png",
        rating: "4,7",
        desc:
            "Sukiyaki is a Japanese dish that is prepared and served in the nabemono style. It consists of meat which is slowly cooked or simmered at the table, alongside vegetables and other ingredients, in a shallow iron pot in a mixture of soy sauce, sugar, and mirin."),

    //sushi
    Food(
        name: "Sushi",
        price: "15.000",
        imagePath: "lib/images/sushi.png",
        rating: "4,8",
        desc:
            "Sushi is a Japanese dish of prepared vinegared rice, usually with some sugar and salt, accompanying a variety of ingredients, such as seafood, often raw, and vegetables."),

    //takoyaki
    Food(
        name: "Takoyaki",
        price: "12.000",
        imagePath: "lib/images/takoyaki.png",
        rating: "4,7",
        desc:
            "Takoyaki is a ball-shaped Japanese snack made of a wheat flour-based batter and cooked in a special molded pan. It is typically filled with minced or diced octopus, tempura scraps, pickled ginger, and green onion."),

    //tempura
    Food(
        name: "Tempura",
        price: "10.000",
        imagePath: "lib/images/tempura.png",
        rating: "4,6",
        desc:
            "Tempura is a Japanese dish usually consisting of seafood or vegetables that have been battered and deep fried."),

    //tendon
    Food(
        name: "Tendon",
        price: "22.000",
        imagePath: "lib/images/tendon.png",
        rating: "4,7",
        desc:
            "Tendon is a Japanese one-bowl meal consisting of a bowl of rice topped with tempura, specifically with seafood and vegetables."),

    //udon
    Food(
        name: "Udon",
        price: "45.000",
        imagePath: "lib/images/udon.png",
        rating: "4,9",
        desc:
            "Udon is a type of thick, wheat-flour noodle used frequently in Japanese cuisine. It is often served hot as a noodle soup in its simplest form, as kake udon, in a mildly flavoured broth called kakejiru, which is made of dashi, soy sauce, and mirin. It is usually topped with thinly chopped scallions."),

    //yakitori
    Food(
        name: "Yakitori",
        price: "15.000",
        imagePath: "lib/images/yakitori.png",
        rating: "4,6",
        desc:
            "Yakitori is a Japanese type of skewered chicken. Its preparation involves skewering the meat with kushi, a type of skewer typically made of steel, bamboo, or similar materials. Afterwards, they are grilled over a charcoal fire."),
  ];

  //cust cart
  List<Food> _cart = [];

  //getter
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
