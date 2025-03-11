import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/util/cont_color.dart';

class OrderDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.redAccent),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Order details',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  _buildOrderItem('Chicken Burger', 'Burger Factory LTD',
                      'assets/images/imageone.png', 20),
                  _buildOrderItem('Onion Pizza', 'Pizza Palace',
                      'assets/images/imagetwo.png', 15),
                  _buildOrderItem('Spicy Shawarma', 'Hot Cool Spot',
                      'assets/images/imagethree.png', 15),
                ],
              ),
            ),
            _buildOrderSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String name, String place, String image, int price) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child:
                  Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(place, style: TextStyle(color: Colors.grey)),
                  Text('\$${price}',
                      style: TextStyle(color: Colors.redAccent, fontSize: 16)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.remove, color: Colors.redAccent),
                    onPressed: () {}),
                Text('1',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                    icon: Icon(Icons.add, color: Colors.redAccent),
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      height: 250,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/vieworder.png'),
          fit: BoxFit.cover,
        ),
        color: sttext,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSummaryRow('Sub-Total', '100\$'),
          _buildSummaryRow('Delivery Charge', '10\$'),
          _buildSummaryRow('Discount', '-10\$'),
          Divider(color: Colors.white),
          _buildSummaryRow('Total', '110\$', isBold: true),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Get.toNamed('thanks');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('Place My Order',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String amount, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isBold ? 18 : 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isBold ? 18 : 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
