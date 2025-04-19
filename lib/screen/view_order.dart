import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopstore/controller/cart_controller.dart';
import 'package:shopstore/util/cont_color.dart';

class OrderDetailsPage extends StatelessWidget {
  // Ensure the CartController is initialized and accessible
  final CartController cartController = Get.find<CartController>();

  OrderDetailsPage() {
    // Debug: Print the cart items when the page is loaded
    print("Cart items on page load: ${cartController.cartItems.length}");
    cartController.cartItems.forEach((item) {
      print("Item: ${item['name']}, Quantity: ${item['quantity']}");
    });
  }

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
                    onPressed: () {
                      Get.back();
                    },
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
              child: Obx(() {
                // Debug: Print the cart items whenever the Obx rebuilds
                print(
                    "Obx rebuild - Cart items: ${cartController.cartItems.length}");
                return cartController.cartItems.isEmpty
                    ? Center(child: Text("No items in cart"))
                    : ListView.builder(
                        padding: EdgeInsets.all(16.0),
                        itemCount: cartController.cartItems.length,
                        itemBuilder: (context, index) {
                          var item = cartController.cartItems[index];
                          return _buildOrderItem(
                            item['name'],
                            item['place'],
                            item['image'],
                            item['price'],
                            item['quantity'],
                            index,
                          );
                        },
                      );
              }),
            ),
            _buildOrderSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String name, String place, String image, int price,
      int quantity, int index) {
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
                    onPressed: () {
                      cartController.decrementQuantity(index);
                    }),
                Text('$quantity',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                    icon: Icon(Icons.add, color: Colors.redAccent),
                    onPressed: () {
                      cartController.incrementQuantity(index);
                    }),
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
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryRow(
                  'Sub-Total', '${cartController.getSubTotal()}\$'),
              _buildSummaryRow('Delivery Charge', '10\$'),
              _buildSummaryRow('Discount', '-10\$'),
              Divider(color: Colors.white),
              _buildSummaryRow('Total', '${cartController.getTotal()}\$',
                  isBold: true),
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
          )),
    );
  }

  /// Helper method to build summary rows
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
