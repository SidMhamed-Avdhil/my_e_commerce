import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/view/cart_screen.dart';
import 'package:my_e_commerce/view/favorite_screen.dart';
import 'package:my_e_commerce/view/home_screen.dart';
import 'package:my_e_commerce/view/profile_screen.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomeScreen();
  get navigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;
  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentScreen = HomeScreen();
        break;
      case 1:
        _currentScreen = CartScreen();
        break;
      case 2:
        _currentScreen = FavoriteScreen();
        break;
      case 3:
        _currentScreen = ProfileScreen();
      default:
        _currentScreen = HomeScreen();
    }
    update();
  }
}
