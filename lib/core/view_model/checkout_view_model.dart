import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/helper/enum.dart';
import 'package:my_e_commerce/view/control_view.dart';

class CheckOutViewModel extends GetxController {
  final List<String> _processes = [
    "Delivery",
    "Address",
    "Summary",
  ];
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  List<String> get processes => _processes;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  String? stree1, street2, city, state, country;
  GlobalKey<FormState> formState = GlobalKey();

  void changeIndex(int i) {
    _currentIndex = i;
    if (_currentIndex == 1) {
      _pages = Pages.AddAddress;
    } else if (_currentIndex == 2) {
      _pages = Pages.Summery;
    } else if (_currentIndex == 3) {
      Get.to(ControlView());
    }
    update();
  }

  Color getColor(int i) {
    if (i == _currentIndex) {
      return primaryColor;
    } else if (i < _currentIndex) {
      return primaryColor;
    } else {
      return todoColor;
    }
  }
}
