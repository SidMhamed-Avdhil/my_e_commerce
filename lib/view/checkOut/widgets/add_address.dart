import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/core/view_model/checkout_view_model.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';
import 'package:my_e_commerce/view/widgets/custom_text_from_field.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              right: 30.0,
              left: 30.0,
            ),
            child: Column(
              children: [
                CustomText(
                  text: 'Billing address is the sames as delivery address',
                  alignment: Alignment.center,
                  fontSize: 18,
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  text: 'Street 1',
                  hint: '21, Alex Davidson Avenue',
                  onSave: (value) {
                    controller.stree1 = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'you must write your street';
                    }
                  },
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  text: 'Street 2',
                  hint: '35, Dock Davidson Avenue',
                  onSave: (value) {
                    controller.street2 = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {}
                  },
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  text: 'City',
                  hint: 'Nouackchott',
                ),
                SizedBox(height: 15),
                Container(
                  width: Get.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: CustomTextFormField(
                            text: 'State',
                            hint: 'Lagos State',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: CustomTextFormField(
                            text: 'Country',
                            hint: 'Mauritania',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
