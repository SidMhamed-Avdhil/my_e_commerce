import 'package:flutter/material.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';

import '../../app_constant.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  CustomButton({
    this.text,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPressed as void Function(),
      color: primaryColor,
      child: CustomText(
        text: text!,
        alignment: Alignment.center,
        color: Colors.white,
      ),
    );
  }
}
