import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/view_model/cart_view_model.dart';
import 'package:my_e_commerce/view/checkOut/checkout_screen.dart';
import 'package:my_e_commerce/view/widgets/custom_button.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => Scaffold(
        backgroundColor: backColor,
        body: controller.cartProductModel.length == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/cart_empty.svg",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    text: 'Cart Empty',
                    fontSize: 32,
                    alignment: Alignment.center,
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.separated(
                        itemCount: controller.cartProductModel.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: Key(controller
                                .cartProductModel[index].computerId
                                .toString()),
                            dismissThresholds: const {
                              DismissDirection.startToEnd: 0.05,
                              DismissDirection.endToStart: 0.05,
                            },
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: 100,
                              child: const Icon(
                                Icons.delete,
                                color: secondColor,
                                size: 30,
                              ),
                            ),
                            secondaryBackground: Container(
                              color: primaryColor,
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: 100,
                              child: const Icon(
                                Icons.star,
                                color: secondColor,
                                size: 30,
                              ),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.startToEnd) {
                                controller.removeFromCart(index);
                              } else {
                                // controller.addToFavorites(index);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: secondColor,
                                ),
                              ),
                              height: 150,
                              child: Row(
                                children: [
                                  Container(
                                    color: secondColor,
                                    width: 150,
                                    child: Image.network(
                                      controller.cartProductModel[index].image!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: controller
                                              .cartProductModel[index].name!,
                                          fontSize: 20,
                                        ),
                                        const SizedBox(height: 10),
                                        CustomText(
                                          text:
                                              '\$ ${controller.cartProductModel[index].price}',
                                          color: primaryColor,
                                          fontSize: 18,
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          width: 140,
                                          height: 40,
                                          color: secondColor,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                child: const Icon(
                                                  Icons.add,
                                                  color: ColorIcons,
                                                ),
                                                onTap: () {
                                                  controller
                                                      .increaseQuantity(index);
                                                },
                                              ),
                                              const SizedBox(width: 20),
                                              CustomText(
                                                text: controller
                                                    .cartProductModel[index]
                                                    .quantity!
                                                    .toString(),
                                                fontSize: 20,
                                                alignment: Alignment.center,
                                              ),
                                              const SizedBox(width: 20),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20.0),
                                                child: GestureDetector(
                                                  child: const Icon(
                                                    Icons.minimize,
                                                    color: ColorIcons,
                                                  ),
                                                  onTap: () {
                                                    controller
                                                        .dencreaseQuantity(
                                                            index);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'TOTAL',
                              fontSize: 20,
                              color: textColor,
                            ),
                            const SizedBox(height: 10),
                            GetBuilder<CartViewModel>(
                              init: CartViewModel(),
                              builder: (controller) => CustomText(
                                text: '\$ ${controller.totalPrice}',
                                fontSize: 18,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Expanded(
                          child: CustomButton(
                            text: 'CHECKOUT',
                            onPressed: () {
                              Get.to(CheckoutScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
