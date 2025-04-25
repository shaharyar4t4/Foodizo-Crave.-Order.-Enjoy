import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/util/cont_color.dart';

class VeiwSearch extends StatefulWidget {
  const VeiwSearch({super.key});

  @override
  State<VeiwSearch> createState() => _VeiwSearchState();
}

class _VeiwSearchState extends State<VeiwSearch> {
  final List<Map<String, String>> meals = [
    {
      "name": "Chicken Spagetti",
      "desc": "1 Big Pack",
      "price": "\$7",
      "image": "assets/images/spagetti.jpg"
    },
    {
      "name": "Jollof Rice",
      "desc": "1 Combo Pack",
      "price": "\$10",
      "image": "assets/images/rices.jpg"
    },
    {
      "name": "Fruity Pancakes",
      "desc": "Noodle Home",
      "price": "\$12",
      "image": "assets/images/foot.jpg"
    },
    {
      "name": "Pepper Pizza",
      "desc": "5kg box of Pizza",
      "price": "\$15",
      "image": "assets/images/pizz.jpg"
    },
    {
      "name": "Grilled Chicken",
      "desc": "With Mixed Veggies",
      "price": "\$14",
      "image": "assets/images/grilled_chicken.jpg"
    },
    {
      "name": "Cheese Burger",
      "desc": "Double Patty with Fries",
      "price": "\$9",
      "image": "assets/images/product1.jpg"
    },
    {
      "name": "Taco Fiesta",
      "desc": "3 Tacos Special",
      "price": "\$8",
      "image": "assets/images/taco.jpg"
    },
    {
      "name": "Veggie Wrap",
      "desc": "Healthy Veg Wrap",
      "price": "\$6",
      "image": "assets/images/wrap.jpg"
    },
    {
      "name": "Beef Steak",
      "desc": "With Mashed Potatoes",
      "price": "\$16",
      "image": "assets/images/steak.jpg"
    },
    {
      "name": "Caesar Salad",
      "desc": "Fresh Lettuce & Chicken",
      "price": "\$7",
      "image": "assets/images/salad.jpg"
    },
    {
      "name": "Seafood Pasta",
      "desc": "Shrimp and Squid Mix",
      "price": "\$13",
      "image": "assets/images/seafood_pasta.jpg"
    },
  ];

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredMeals = meals
        .where((meal) =>
            meal['name']!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  Container(
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
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xAEFFD7D7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.notification_add_sharp, color: sttext),
                      onPressed: () {
                        Get.toNamed('/order');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26.0, top: 15.0),
              child: const Text("Main Menu",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
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
            Expanded(
              child: ListView.builder(
                itemCount: filteredMeals.length,
                itemBuilder: (context, index) {
                  final meal = filteredMeals[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          color: Colors.grey.shade200,
                          offset: Offset(2, 2),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            meal['image']!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(meal['name']!,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Text(meal['desc']!,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 13)),
                            ],
                          ),
                        ),
                        Text(meal['price']!,
                            style: const TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            )),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
