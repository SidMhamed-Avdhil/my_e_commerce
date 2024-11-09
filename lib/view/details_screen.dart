import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/view_model/cart_view_model.dart';
import 'package:my_e_commerce/model/cart_model.dart';
import 'package:my_e_commerce/model/product_model.dart';
import 'package:my_e_commerce/view/widgets/custom_button.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  ComputerModel computerModel;
  DetailsScreen({required this.computerModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Container(
        padding: EdgeInsets.only(
          top: 35,
        ),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 280,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: computerModel.imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    computerModel.imageUrls[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 30),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text:
                              computerModel.brand + ' | ' + computerModel.model,
                          fontSize: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'CPU : ',
                              ),
                              CustomText(
                                text: computerModel.cpu.brand!,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'RAM : ',
                              ),
                              CustomText(
                                text: computerModel.memory.toString(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Hard Disk : ',
                              ),
                              CustomText(
                                text:
                                    computerModel.storage.capacity.toString() +
                                        ' ' +
                                        computerModel.storage.type!,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'OS : ',
                              ),
                              CustomText(
                                text: computerModel.operatingSystem.name
                                        .toString() +
                                    ' ' +
                                    computerModel.operatingSystem.version!,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Details',
                          fontSize: 18,
                        ),
                        SizedBox(height: 5),
                        CustomText(
                          text: computerModel.description!,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 16,
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: 'PRICE ',
                        fontSize: 22,
                        color: textColor,
                      ),
                      CustomText(
                        text: "\$" + computerModel.price.toString(),
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => Container(
                      width: 150,
                      child: CustomButton(
                        text: 'ADD',
                        onPressed: () {
                          controller.addProductToCart(
                            CartModel(
                              computerId: computerModel.computerId,
                              name:
                                  "${computerModel.brand + '|' + computerModel.model}",
                              image: computerModel.imageUrls[0],
                              quantity: 1,
                              price: computerModel.price.toString(),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
