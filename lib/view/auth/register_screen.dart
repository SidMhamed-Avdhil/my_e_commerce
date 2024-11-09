import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/view_model/auth_view_model.dart';
import 'package:my_e_commerce/view/auth/login_screen.dart';
import 'package:my_e_commerce/view/widgets/custom_button.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';
import 'package:my_e_commerce/view/widgets/custom_text_from_field.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        // leading: GestureDetector(
        //   onTap: () {
        //     Get.off(LoginScreen());
        //   },
        //   child: Icon(
        //     Icons.arrow_back,
        //     color: primaryColor,
        //   ),
        // ),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "4".tr,
                      fontSize: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  text: "14".tr,
                  hint: "Mouhamed",
                  onSave: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  text: "8".tr,
                  hint: "example@gmail.com",
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  text: "9".tr,
                  hint: "*********",
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
                const SizedBox(height: 40),
                CustomButton(
                  text: "4".tr,
                  onPressed: () {
                    _globalKey.currentState!.save();
                    if (_globalKey.currentState!.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
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
