import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/util/cont_color.dart';

class ProductPage extends StatelessWidget {
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
                      image: AssetImage('assets/images/product.png'),
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
                    height: MediaQuery.of(context).size.height *
                        0.65, // Reduced height
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
                            height:
                                6, // Added height to the inner container for visibility
                            decoration: BoxDecoration(
                              color: bar_color, // Ensure bar_color is defined
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          color: bar_color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Popular',
                          style: TextStyle(
                              color: sttext, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: bar_color,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          CupertinoIcons.location_solid,
                          color: sttext,
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: cir_color,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(CupertinoIcons.heart, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Chicken Burger Promo Pack',
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                // Row(
                //   children: [
                //     Icon(Icons.star, color: Colors.amber, size: 20),
                //     SizedBox(width: 4),
                //     Text('4.8 Rating', style: TextStyle(color: Colors.grey)),
                //     SizedBox(width: 10),
                //     Text('7000+ Orders', style: TextStyle(color: Colors.grey)),
                //   ],
                // ),
                SizedBox(height: 8),
                // Text(
                //   'In a medium bowl, add ground chicken, breadcrumbs, mayonnaise, onions, parsley, garlic, paprika, salt and pepper. Use your hands to combine all the ingredients together.',
                //   style: TextStyle(color: Colors.black),
                // ),
                SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.pinkAccent,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //     ),
                //     onPressed: () {
                //       Get.toNamed('order');
                //     },
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(vertical: 14),
                //       child: Text(
                //         'Add To Cart',
                //         style: TextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
