import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/util/cont_color.dart';
import 'package:flutter/cupertino.dart';

class ViewDashbored extends StatefulWidget {
  const ViewDashbored({super.key});

  @override
  State<ViewDashbored> createState() => _ViewDashboredState();
}

class _ViewDashboredState extends State<ViewDashbored> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: Image.asset("assets/images/pattern.png").image, fit: BoxFit.cover) ,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, color: Colors.black),
                    Row(
                      children: [
                        Icon(CupertinoIcons.location_solid, color: sttext),
                        Text(
                          'Freedom way, Lekki phase',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/product.png'),
                      // Replace with your asset path
                      radius: 20,
                    ),
                  ],
                ),
              ),
              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(CupertinoIcons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFFFF0F0),
                  ),
                ),
              ),
              // Special Offer Banner
              // Container(
              //   margin: EdgeInsets.all(8.0),
              //   padding: EdgeInsets.only(
              //     left: 10,
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.red[400],
              //     borderRadius: BorderRadius.circular(12.0),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.white,
              //         spreadRadius: 2,
              //         blurRadius: 5,
              //         offset: Offset(0, 2),
              //       ),
              //     ],
              //   ),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(left: 10, top: 10),
              //               child: Text(
              //                 'Special Offer for March',
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(top: 10, left: 10),
              //               child: Text(
              //                 'We are here with the best desserts in town.',
              //                 style:
              //                     TextStyle(fontSize: 14, color: Colors.white),
              //               ),
              //             ),
              //             OutlinedButton(
              //               onPressed: () {},
              //               child: Text("Shop Now"),
              //               style: ElevatedButton.styleFrom(
              //                   backgroundColor: Colors.white),
              //             )
              //           ],
              //         ),
              //       ),
              //       Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             bottomRight: Radius.circular(12.0),
              //             bottomLeft: Radius.circular(12.0),
              //           ),
              //         ),
              //         child: Image.asset(
              //           'assets/images/bgbanner.png',
              //           height: 170,
              //           // Replace with your burger image asset path
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Food Categories (Horizontal Scroll)
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 16.0),
              //   height: 60,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       _buildCategoryItem('Burger', Icons.fastfood, Colors.pink),
              //       _buildCategoryItem('Pizza', Icons.local_pizza, Colors.pink),
              //       _buildCategoryItem(
              //           'Sandwich', Icons.send_and_archive, Colors.pink),
              //     ],
              //   ),
              // ),
              // Food Items Grid
              // GridView.count(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   crossAxisCount: 2,
              //   padding: EdgeInsets.all(16.0),
              //   childAspectRatio: 0.75,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         Get.toNamed('/product');
              //       },
              //       child: _buildFoodItem(
              //         image: 'assets/images/image1.png',
              //         // Replace with your asset path
              //         title: 'Chicken Burger',
              //         rating: 3.8,
              //         description:
              //             '100 gr chicken burger + tomato + cheese Lettuce',
              //         price: '\$20.00',
              //       ),
              //     ),
              //     _buildFoodItem(
              //       image: 'assets/images/image2.png',
              //       // Replace with your asset path
              //       title: 'Cheese Burger',
              //       rating: 4.5,
              //       description:
              //           '100 gr meat burger + onion + tomato + Lettuce cheese',
              //       price: '\$15.00',
              //     ),
              //   ],
              // ),
              // Popular Meal Menu
              // Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Popular Meal Menu',
              //         style:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //       ),
              //       Text(
              //         'See All',
              //         style: TextStyle(fontSize: 16, color: sttext),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 16.0),
              //   padding: EdgeInsets.all(16.0),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(12.0),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.2),
              //         spreadRadius: 2,
              //         blurRadius: 5,
              //         offset: Offset(0, 2),
              //       ),
              //     ],
              //   ),
              //   child: Row(
              //     children: [
              //       Image.asset(
              //         'assets/images/image3.png',
              //         // Replace with your pizza image asset path
              //         width: 80,
              //         height: 80,
              //         fit: BoxFit.cover,
              //       ),
              //       SizedBox(width: 16),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   'Pepper Pizza',
              //                   style: TextStyle(
              //                       fontSize: 16, fontWeight: FontWeight.bold),
              //                 ),
              //                 Text(
              //                   '\$15',
              //                   style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.pink[300]),
              //                 ),
              //               ],
              //             ),
              //             Text(
              //               '5kg box of pizza',
              //               style: TextStyle(fontSize: 14, color: Colors.grey),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 16), // Add some space at the bottom
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color color) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem({
    required String image,
    required String title,
    required double rating,
    required String description,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: sttext,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  price,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[300]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
