import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/components/product_detial.dart';
import 'package:shopstore/controller/cart_controller.dart';
import 'package:shopstore/util/cont_color.dart';

class ViewProductTwo extends StatelessWidget {
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
                      image: AssetImage('assets/images/product2.jpg'),
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
              title: "Chicken Burger Promo Pack",
              subtitle: "Add to Cart",
              description:
                  "In a medium bowl, add ground chicken, breadcrumbs, mayonnaise, onions, parsley, garlic, paprika, salt and pepper. Use your hands to combine all the ingredients together until blended, but don't over mix.",
              starText: "4,8 Rating",
              orderPack: "7000+ Order",
              barColor: bar_color,
              starColor: star_color,
              sttext: sttext,
              cirColor: cir_color,
              onAddToCart: () {
                cartController.addToCart(
                  "Chicken Burger Promo Pack",
                  "Burger Factory LTD",
                  "assets/images/product.png",
                  20,
                );
                Get.toNamed('order');
              },
            ),
          ],
        ),
      ),
    );
  }
}
