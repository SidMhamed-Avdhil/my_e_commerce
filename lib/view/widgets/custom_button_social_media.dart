import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';

class CustomButtonSocialMedia extends StatelessWidget {
  final String? text;
  final String? imageName;
  final Function? onPressed;

  CustomButtonSocialMedia({
    this.text,
    this.imageName,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: MaterialButton(
        onPressed: onPressed as void Function()?,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(imageName!),
              ),
            ),
            SizedBox(width: 45),
            CustomText(
              text: text!,
            ),
          ],
        ),
      ),
    );
  }
}
