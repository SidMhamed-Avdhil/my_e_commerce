import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/core/view_model/auth_view_model.dart';
import 'package:my_e_commerce/view/auth/register_screen.dart';
import 'package:my_e_commerce/view/widgets/custom_button.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';
import 'package:my_e_commerce/view/widgets/custom_text_from_field.dart';
import '../../app_constant.dart';
import '../widgets/custom_button_social_media.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
          right: 20.0,
          left: 20.0,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "6".tr,
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: CustomText(
                        text: "4".tr,
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: "7".tr,
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  text: "8".tr,
                  hint: "example@gmail.com",
                  onSave: (value) {
                    controller.email = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  text: "9".tr,
                  hint: "*********",
                  onSave: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomText(
                  text: "10".tr,
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "5".tr,
                  onPressed: () {
                    _globalKey.currentState!.save();
                    if (_globalKey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                const SizedBox(height: 15),
                CustomText(
                  text: "11".tr,
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 15),
                CustomButtonSocialMedia(
                  text: "12".tr,
                  imageName: 'assets/images/google.png',
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                ),
                const SizedBox(height: 20),
                CustomButtonSocialMedia(
                  text: "13".tr,
                  imageName: 'assets/images/facebook.png',
                  onPressed: () {
                    // controller.facebookSignInMethod();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
