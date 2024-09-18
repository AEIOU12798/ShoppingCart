import 'package:get/get.dart';

class CartController extends GetxController {
  var selectedItems = <Map<String, dynamic>>[].obs;
  var cartCount = 0.obs;
  var totalAmount = 0.0.obs; // New variable to hold the total amount

  void addItem(String name, String price, String image) {
    selectedItems
        .add({"name": name, "price": double.parse(price), "image": image});
    cartCount.value++;
    calculateTotalAmount(); // Recalculate total amount when item is added
  }

  void removeItem(String name) {
    selectedItems.removeWhere((item) => item['name'] == name);
    cartCount.value--;
    calculateTotalAmount(); // Recalculate total amount when item is removed
  }

  // Method to calculate the total amount
  void calculateTotalAmount() {
    totalAmount.value =
        selectedItems.fold(0.0, (sum, item) => sum + item['price']);
  }
}
