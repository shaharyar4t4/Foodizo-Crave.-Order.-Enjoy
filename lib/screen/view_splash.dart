import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopstore/util/cont_color.dart';

class ViewSplash extends StatefulWidget {
  const ViewSplash({super.key});

  @override
  State<ViewSplash> createState() => _ViewSplashState();
}

class _ViewSplashState extends State<ViewSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Get.toNamed('pizza');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
              opacity: 0.5),
        ),
      ),
      Positioned(
        top: 220,
        child: Center(
            child: LottieBuilder.asset(
          "assets/lottie/Animation - 1741538541848.json",
          width: 300,
          height: 300,
        )),
      ),
      Positioned(
        bottom: 220,
        right: 50,
        child: Text("Food Couriers",
            style: TextStyle(
              color: sttext,
              fontSize: 35,
              fontFamily: 'popinbold',
            )),
      ),
    ]));
  }
}
