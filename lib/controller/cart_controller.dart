import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  void addToCart(String name, String place, String image, int price) {
    cartItems.add({
      'name': name,
      'place': place,
      'image': image,
      'price': price,
      'quantity': 1,
    });
    cartItems.refresh(); // Ensure the UI updates
    print("Added to cart: $name, Total items: ${cartItems.length}");
  }

  void incrementQuantity(int index) {
    cartItems[index]['quantity']++;
    cartItems.refresh();
  }

  void decrementQuantity(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
    } else {
      cartItems.removeAt(index);
    }
    cartItems.refresh();
  }

  double getSubTotal() {
    return cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  double getTotal() {
    double subTotal = getSubTotal();
    double deliveryCharge = 10;
    double discount = 10;
    return subTotal + deliveryCharge - discount;
  }
}
