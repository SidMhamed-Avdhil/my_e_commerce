import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/core/services/home_services.dart';
import 'package:my_e_commerce/model/category_model.dart';
import 'package:my_e_commerce/model/product_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  List<ComputerModel> _computerModel = [];
  List<ComputerModel> get computerModel => _computerModel;

  HomeViewModel() {
    getCategory();
    getBestSellingComputers();
  }
  getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) {
      for (var i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingComputers() async {
    try {
      _loading.value = true;
      await HomeService().getComputer().then((value) {
        for (var i = 0; i < value.length; i++) {
          _computerModel.add(
              ComputerModel.fromJson(value[i].data() as Map<String, dynamic>));
          _loading.value = false;
        }
        print("**************************************");
        print(_computerModel);
        print("**************************************");
        update();
      });
    } catch (e) {
      print("**************************************");
      print("$e");
      print("**************************************");
    }
  }
}
