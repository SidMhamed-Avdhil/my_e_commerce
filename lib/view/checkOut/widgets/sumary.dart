import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/view_model/cart_view_model.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';

class Sumary extends StatelessWidget {
  const Sumary({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          children: [
            Container(
              height: 350,
              padding: EdgeInsets.all(20.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(
                            controller.cartProductModel[index].image!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        CustomText(
                          text: controller.cartProductModel[index].name!,
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          alignment: Alignment.bottomLeft,
                          text:
                              '\$ ${controller.cartProductModel[index].price!}',
                          color: primaryColor,
                        )
                      ],
                    ),
                  );
                },
                itemCount: controller.cartProductModel.length,
                separatorBuilder: (context, index) => SizedBox(width: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
