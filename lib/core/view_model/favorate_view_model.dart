import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/services/database/favorate_database_helper.dart';
import 'package:my_e_commerce/model/favorate_model.dart';

class FavorateViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<FavorateModel> _favorateProduct = [];
  List<FavorateModel> get favorateModel => _favorateProduct;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  var dbHelper = FavorateDatabaseHelper.db;

  FavorateViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    try {
      _loading.value = true;
      _favorateProduct = await dbHelper.getAllProduct();
      _loading.value = false;
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

  // getTotalPrice() async {
  //   for (var i = 0; i < _favorateProduct.length; i++) {
  //     _totalPrice += (double.parse(_cartProductModel[i].price!) *
  //         _cartProductModel[i].quantity!);
  //     update();
  //   }
  // }

  addProductToCart(FavorateModel favorateModel) async {
    final existingItem = _favorateProduct.firstWhereOrNull(
        (item) => item.computerId == favorateModel.computerId);

    if (existingItem != null) {
      Get.snackbar(
        "Alert",
        "Already added in Cart",
        backgroundColor: primaryColor,
        colorText: secondColor,
        dismissDirection: DismissDirection.startToEnd,
      );
    } else {
      _favorateProduct.add(favorateModel);
      await FavorateDatabaseHelper.db.insert(favorateModel);
      _totalPrice +=
          (double.parse(favorateModel.price!) * favorateModel.quantity!);
      update();
    }
  }
}
