import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/components/product_detial.dart';
import 'package:shopstore/controller/cart_controller.dart';
import 'package:shopstore/util/cont_color.dart';

class ViewProductThree extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/pizz.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xAEFFD7D7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: sttext),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.45,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 130,
                            left: 130,
                            top: 10,
                          ),
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: bar_color,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            buildPromoSection(
              title: "Pepper Pizza",
              subtitle: "Add to Cart",
              description:
                  "In a large bowl, add pizza dough, bell peppers, mozzarella cheese, pizza sauce, oregano, olive oil, crushed red pepper, salt and black pepper. Mix until well combined. Spread mixture evenly on a baking sheet lined with parchment paper. Bake for 20-25 minutes.",
              starText: "4.6 Rating",
              orderPack: "6000+ Order",
              barColor: bar_color,
              starColor: star_color,
              sttext: sttext,
              cirColor: cir_color,
              onAddToCart: () {
                cartController.addToCart(
                  "Pepper Pizza",
                  "Burger Factory LTD",
                  "assets/images/pizz.jpg",
                  20,
                );
                Get.toNamed('/order');
              },
            ),
          ],
        ),
      ),
    );
  }
}
