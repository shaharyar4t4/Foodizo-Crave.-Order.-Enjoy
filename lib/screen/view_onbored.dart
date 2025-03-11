import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/util/cont_color.dart';

import '../components/bottom_sheet.dart';

class Onbroad extends StatefulWidget {
  const Onbroad({super.key});

  @override
  State<Onbroad> createState() => _OnbroadState();
}

class _OnbroadState extends State<Onbroad> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  // for title
  final List<String> titles = [
    "Select the Favorities Menu",
    "Good food at a cheap price",
  ];

  //description
  final List<String> descriptions = [
    "Now eat well, don't leave the house, You can choose your favorite food only with one click",
    "Stay home, eat well, and enjoy your favorite food with just one click. No hassle, no wait for delivered to you!",
  ];

  final List<String> image = [
    "assets/images/first.png",
    "assets/images/second.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image, casual
            SizedBox(
              height: 684,
              child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            image[index],
                            height: 350,
                            width: double.infinity, // Adjust height
                          ),
                          const SizedBox(height: 60),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              titles[index],
                              style: TextStyle(
                                fontFamily: 'popinbold',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Text(
                              descriptions[index],
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [sttext, sbtn],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: ElevatedButton(
                              onPressed: () => bottomSheet(),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 17),
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.toNamed('demo');
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      titles.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == index ? sttext : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentIndex == titles.length - 1) {
                        Get.toNamed('demo');
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == titles.length - 1 ? "" : "→",
                      style: TextStyle(color: sttext, fontSize: 40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
