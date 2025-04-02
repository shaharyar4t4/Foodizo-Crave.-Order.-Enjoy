import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildPromoSection({
  required String title,
  required String subtitle,
  required String description,
  required String starText,
  required String orderPack,
  Color? barColor,
  Color? cirColor,
  Color? sttext,
  Color? starColor,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: barColor ?? Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Popular',
                style: TextStyle(
                    color: sttext ?? Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: barColor ?? Colors.grey,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                CupertinoIcons.location_solid,
                color: sttext ?? Colors.white,
              ),
            ),
            SizedBox(width: 13),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: cirColor ?? Colors.grey,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(CupertinoIcons.heart_solid, color: Colors.black),
            ),
          ],
        ),
      ),
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Text(
          title,
          style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Icon(CupertinoIcons.star_circle,
                color: starColor ?? Colors.yellow, size: 20),
            SizedBox(width: 4),
            Text(starText, style: TextStyle(color: Colors.grey)),
            SizedBox(width: 10),
            Icon(CupertinoIcons.bag, color: sttext ?? Colors.white, size: 20),
            SizedBox(width: 4),
            Text(orderPack, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Text(
          description,
          style: TextStyle(color: Colors.black),
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          width: 350,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: sttext ?? Colors.white,
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
                subtitle,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
