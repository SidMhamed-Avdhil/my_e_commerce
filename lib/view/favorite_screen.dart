import 'package:flutter/material.dart';
import 'package:my_e_commerce/app_constant.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Center(
        child: Text(
          "Page Cart",
        ),
      ),
    );
  }
}
