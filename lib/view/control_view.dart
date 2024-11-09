import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/view_model/auth_view_model.dart';
import 'package:my_e_commerce/core/view_model/control_view_model.dart';
import 'package:my_e_commerce/view/auth/login_screen.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (AuthViewModel().user != null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: NavBarNavigationBar(),
              ),
            );
    });
  }

  Widget NavBarNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black,
        backgroundColor: secondColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: secondColor,
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_checkout_sharp,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star_border_outlined,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
