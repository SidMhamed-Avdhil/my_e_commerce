import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/main.dart';

class MyLocaleController extends GetxController {
  Locale initialLang =
      sharepref!.getString("lang") == "ar" ? Locale("ar") : Locale("en");
  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    sharepref!.setString("lang", codelang);
    Get.updateLocale(locale);
  }
}
