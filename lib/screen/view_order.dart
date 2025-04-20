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
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
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

  // Build the order item widget
  Widget _buildOrderItem(String name, String place, String image, int price,
      int quantity, int index) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
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
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(place,
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(height: 10),
                  Text('\$${price}',
                      style: TextStyle(
                          color: sttext,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                    icon: Container(
                        decoration: BoxDecoration(
                          color: cir_color1,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(Icons.remove, color: sttext)),
                    onPressed: () {
                      cartController.decrementQuantity(index);
                    }),
                Text('$quantity',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                    icon: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [sttext, sbtn],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(Icons.add, color: Colors.white)),
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

  // Build the order summary section
  Widget _buildOrderSummary() {
    return Container(
      height: 250,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [sttext, sbtn],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/vieworder.png'),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
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
