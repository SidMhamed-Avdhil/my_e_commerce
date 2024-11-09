import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/app_constant.dart';
import 'package:my_e_commerce/core/view_model/profile_view_model.dart';
import 'package:my_e_commerce/view/auth/login_screen.dart';
import 'package:my_e_commerce/view/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: backColor,
              body: Container(
                padding: EdgeInsets.only(
                  top: 50,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                image: DecorationImage(
                                  image: controller.userModel == null
                                      ? AssetImage("assets/images/user.png")
                                      : NetworkImage(
                                              controller.userModel.image!)
                                          as ImageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: controller.userModel.name!,
                                  fontSize: 25,
                                ),
                                SizedBox(height: 10),
                                CustomText(
                                  text: controller.userModel.email!,
                                  fontSize: 15,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 80),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Edit Profile',
                            ),
                            leading:
                                Image.asset("assets/images/edit_profile.png"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Shipping Address',
                            ),
                            leading: Image.asset("assets/images/address.png"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Order Histoy',
                            ),
                            leading:
                                Image.asset("assets/images/order_history.png"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Cards',
                            ),
                            leading: Image.asset("assets/images/cards.png"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Notifications',
                            ),
                            leading:
                                Image.asset("assets/images/notification.png"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        child: MaterialButton(
                          onPressed: () {
                            controller.signOut();
                            Get.offAll(LoginScreen());
                          },
                          child: ListTile(
                            title: CustomText(
                              text: 'Log Out',
                            ),
                            leading: Image.asset("assets/images/logOut.png"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
