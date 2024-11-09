import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/Locale/locale.dart';
import 'package:my_e_commerce/Locale/locale_controller.dart';
import 'package:my_e_commerce/core/view_model/cart_view_model.dart';
import 'package:my_e_commerce/firebase_options.dart';
import 'package:my_e_commerce/helper/binding.dart';
import 'package:my_e_commerce/view/control_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharepref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharepref = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.lazyPut(() => CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ECommerce",
      initialBinding: MyBindings(),
      locale: controller.initialLang,
      translations: MyLocale(),
      getPages: [
        GetPage(
          name: "/",
          page: () => ControlView(),
        ),
      ],
    );
  }
}
