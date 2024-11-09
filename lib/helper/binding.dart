import 'package:get/get.dart';
import 'package:my_e_commerce/core/view_model/auth_view_model.dart';
import 'package:my_e_commerce/core/view_model/cart_view_model.dart';
import 'package:my_e_commerce/core/view_model/checkout_view_model.dart';
import 'package:my_e_commerce/core/view_model/control_view_model.dart';
import 'package:my_e_commerce/core/view_model/home_view_model.dart';
import 'package:my_e_commerce/core/view_model/profile_view_model.dart';
import 'package:my_e_commerce/helper/local_storage_data.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => CheckOutViewModel());
  }
}
