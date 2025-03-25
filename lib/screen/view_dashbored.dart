import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/components/category_Item.dart';
import 'package:shopstore/util/cont_color.dart';
import 'package:flutter/cupertino.dart';

class ViewDashbored extends StatefulWidget {
  const ViewDashbored({super.key});

  @override
  State<ViewDashbored> createState() => _ViewDashboredState();
}

class _ViewDashboredState extends State<ViewDashbored> {

  int selectedIndex = -1;
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
                  image: DecorationImage(
                      image: Image.asset("assets/images/pattern.png").image,
                      fit: BoxFit.cover),
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
              SizedBox(
                height: 15,
              ),
              Container(
                width: 350,
                height: 160,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [sttext, sbtn1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Special Offer",
                            style: TextStyle(
                                fontFamily: "popinbold",
                                color: Colors.white,
                                fontSize: 15),
                          ),
                          Text(
                            "for March",
                            style: TextStyle(
                                fontFamily: "popinbold",
                                color: Colors.white,
                                fontSize: 15),
                          ),
                          Text(
                            "We are here with the",
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          ),
                          Text(
                            "best deserts in town.",
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                            child: Center(
                                child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  color: sbtn,
                                  fontSize: 10,
                                  fontFamily: "popinbold"),
                            )),
                          )
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      // Apply border radius
                      child: Image.asset(
                        'assets/images/bgbanner.png',
                        height: 200,
                        fit: BoxFit
                            .cover, // Ensures the image covers the area properly
                      ),
                    )
                  ],
                ),
              ),
              // Food Categories (Horizontal Scroll)
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0),
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryItem(
                      title: 'Burger',
                      image: "assets/images/burger.png",
                      color: sttext,
                      isSelected: selectedIndex == 0, // Check selection
                      onTap: () {
                        setState(() {
                          selectedIndex = 0; // Update selection
                        });
                      },
                    ),
                    CategoryItem(
                      title: 'Pizza',
                      image: "assets/images/pizza.png",
                      color: sttext,
                      isSelected: selectedIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                    CategoryItem(
                      title: 'Sandwich',
                      image: "assets/images/hotdog.png",
                      color: sttext,
                      isSelected: selectedIndex == 2,
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                  ],
                ),
              ),
              // Food Items Grid
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                childAspectRatio: 0.66,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/product');
                    },
                    child: _buildFoodItem(
                      image: 'assets/images/product1.png',
                      // Replace with your asset path
                      title: 'Chicken Burger',
                      rating: 3.8,
                      description:
                          '100 gr chicken burger + tomato + cheese Lettuce',
                      price: '\$20.',
                    ),
                  ),
                  _buildFoodItem(
                    image: 'assets/images/product2.png',
                    // Replace with your asset path
                    title: 'Cheese Burger',
                    rating: 4.5,
                    description:
                        '100 gr meat burger + onion + tomato + cheese',
                    price: '\$15.',
                  ),
                ],
              ),
              // Popular Meal Menu
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Meal Menu',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 17,),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                padding: EdgeInsets.all(10.0),
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
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/image3.png',
                      // Replace with your pizza image asset path
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pepper Pizza',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\$15',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: sttext),
                              ),
                            ],
                          ),
                          Text(
                            '5kg box of pizza',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Add some space at the bottom
            ],
          ),
        ),
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

      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: Row(
              children: [
                Icon(Icons.star, color: star_color, size: 20),
                SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Image.asset(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
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
                  ],
                ),
                SizedBox(height: 8,),
                Text(
                  description,
                  style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: sttext),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            "00",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: sttext),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: sttext,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
