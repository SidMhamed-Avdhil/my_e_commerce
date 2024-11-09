import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/services/database/cart_database_helper.dart';
import 'package:my_e_commerce/model/cart_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartModel> _cartProductModel = [];
  List<CartModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    try {
      _loading.value = true;
      _cartProductModel = await dbHelper.getAllProduct();
      _loading.value = false;
      getTotalPrice();
      update();
    } catch (e) {
      print("Error : $e");
      Get.snackbar(
        "Error",
        "$e",
        backgroundColor: primaryColor,
        colorText: secondColor,
        dismissDirection: DismissDirection.startToEnd,
      );
    }
  }

  getTotalPrice() async {
    for (var i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity!);
      update();
    }
  }

  addProductToCart(CartModel cartModel) async {
    final existingItem = _cartProductModel
        .firstWhereOrNull((item) => item.computerId == cartModel.computerId);

    if (existingItem != null) {
      Get.snackbar(
        "Alert",
        "Already added in Cart",
        backgroundColor: primaryColor,
        colorText: secondColor,
        dismissDirection: DismissDirection.startToEnd,
      );
    } else {
      _cartProductModel.add(cartModel);
      await CartDatabaseHelper.db.insert(cartModel);
      _totalPrice += (double.parse(cartModel.price!) * cartModel.quantity!);
      update();
    }
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! + 1;
    _totalPrice += (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  dencreaseQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! - 1;
    _totalPrice -= (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  void removeFromCart(int index) async {
    CartModel itemToRemove = _cartProductModel[index];
    _cartProductModel.removeAt(index);
    _totalPrice -= (double.parse(itemToRemove.price!) * itemToRemove.quantity!);
    await dbHelper.deleteProduct(itemToRemove);
    update();
  }
}
