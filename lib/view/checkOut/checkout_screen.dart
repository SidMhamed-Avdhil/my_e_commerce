import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/view_model/checkout_view_model.dart';
import 'package:my_e_commerce/helper/enum.dart';
import 'package:my_e_commerce/view/checkOut/widgets/add_address.dart';
import 'package:my_e_commerce/view/checkOut/widgets/delevery_time.dart';
import 'package:my_e_commerce/view/checkOut/widgets/Sumary.dart';
import 'package:my_e_commerce/view/widgets/custom_button.dart';
import 'package:status_change/status_change.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("CheckOut"),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(controller.processes.length, (index) {
                  final process = controller.processes[index];
                  final color = controller.getColor(index) ?? secondColor;

                  return Column(
                    children: [
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index <= controller.currentIndex
                              ? color
                              : Colors.grey,
                          border: Border.all(color: color, width: 1),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        process,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            controller.pages == Pages.DeliveryTime
                ? DeliveryTime()
                : controller.pages == Pages.AddAddress
                    ? AddAddress()
                    : Sumary(),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(20),
                width: 200,
                child: CustomButton(
                  onPressed: () {
                    controller.changeIndex(controller.currentIndex + 1);
                  },
                  text: 'NEXT',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
