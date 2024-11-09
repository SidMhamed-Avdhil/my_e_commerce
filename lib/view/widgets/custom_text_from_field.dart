import 'package:flutter/material.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? hint;
  final String? Function(String?)? onSave;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  CustomTextFormField({
    this.text,
    this.hint,
    this.onSave,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CustomText(
            text: text!,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint!,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
