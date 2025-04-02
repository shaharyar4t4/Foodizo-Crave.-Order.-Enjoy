import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/util/cont_color.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/product.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 380,
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
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
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 12, right: 12),
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          color: sttext,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Popular',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.favorite_border, color: Colors.black),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Chicken Burger Promo Pack',
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text('4.8 Rating', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10),
                      Text('7000+ Orders',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'In a medium bowl, add ground chicken, breadcrumbs, mayonnaise, onions, parsley, garlic, paprika, salt and pepper. Use your hands to combine all the ingredients together.',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed('order');
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
