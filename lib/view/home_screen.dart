import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/view_model/home_view_model.dart';
import 'package:my_e_commerce/view/details_screen.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Scaffold(
              backgroundColor: backColor,
              body: Center(child: CircularProgressIndicator()),
            )
          : Scaffold(
              backgroundColor: backColor,
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      SizedBox(height: 30),
                      CustomText(
                        text: "15".tr,
                      ),
                      SizedBox(height: 30),
                      _listViewCategory(),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Slling",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See all",
                            fontSize: 18,
                            color: primaryColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      _listViewProducts(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: secondColor,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: ColorIcons,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: secondColor),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.network(
                      controller.categoryModel[index].image!,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomText(
                  text: controller.categoryModel[index].name!,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 260,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.computerModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  DetailsScreen(
                    computerModel: controller.computerModel[index],
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * .4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: secondColor,
                          )),
                      child: Image.network(
                        controller.computerModel[index].imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: controller.computerModel[index].brand,
                      alignment: Alignment.bottomLeft,
                      color: textColor,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: controller.computerModel[index].model,
                      alignment: Alignment.bottomLeft,
                      color: textColor,
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: "${controller.computerModel[index].price} \$",
                      color: primaryColor,
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
