import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japan_restaurant/components/button.dart';
import 'package:japan_restaurant/theme/colors.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantityCount = 0;

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart() {
    //only add to cart if there is something in the cart
    if (quantityCount > 0) {
      //get access to the cart
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantityCount);

      //let user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Successfully added to cart",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            //okay btn
            IconButton(
              onPressed: () {
                //pop once to remove dialog
                Navigator.pop(context);

                //pop again to go previous page
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done, color: Colors.white),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(height: 25),

                  //rating
                  Row(
                    children: [
                      //star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(width: 5),

                      //rating
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),

                  const SizedBox(height: 10),

                  //name
                  Text(widget.food.name,
                      style: GoogleFonts.dmSerifDisplay(fontSize: 28)),

                  const SizedBox(height: 25),

                  //desc
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.food.desc,
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 14, height: 2),
                  )
                ],
              ),
            ),
          ),

          //price + quantity + add to cart
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                //price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      "Rp${widget.food.price}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),

                    //quantity
                    Row(
                      children: [
                        //minus
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () => decrementQuantity(),
                          ),
                        ),

                        //quantity
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),

                        //plus
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () => incrementQuantity(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                //add to cart
                MyButton(
                  text: "Add To Cart",
                  onTap: addToCart,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
