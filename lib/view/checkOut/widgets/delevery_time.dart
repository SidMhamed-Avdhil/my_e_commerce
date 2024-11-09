import 'package:flutter/material.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/helper/enum.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          RadioListTile<Delivery>(
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (value) {
              setState(() {
                delivery = value!;
              });
            },
            title: CustomText(
              text: 'Standard Delivery',
              fontSize: 20,
            ),
            subtitle: CustomText(
              text: '\nOrder will be delivered between 3 - 5 business days',
              fontSize: 15,
            ),
            activeColor: primaryColor,
          ),
          SizedBox(height: 10),
          RadioListTile<Delivery>(
            value: Delivery.NextDayDelivery,
            groupValue: delivery,
            onChanged: (value) {
              setState(() {
                delivery = value!;
              });
            },
            title: CustomText(
              text: 'Next Day Delivery',
              fontSize: 20,
            ),
            subtitle: CustomText(
              text:
                  '\nPlace your order before 6pm and your items will be delivered the next day',
              fontSize: 15,
            ),
            activeColor: primaryColor,
          ),
          SizedBox(height: 10),
          RadioListTile<Delivery>(
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (value) {
              setState(() {
                delivery = value!;
              });
            },
            title: CustomText(
              text: 'Nominated Delivery',
              fontSize: 20,
            ),
            subtitle: CustomText(
              text:
                  '\nPick a particular date from the calendar and order will be delivered on selected date',
              fontSize: 15,
            ),
            activeColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
