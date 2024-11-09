// In a separate file (e.g., special_service.dart)

import 'package:get/get.dart';

class SpecialService extends GetxController {
  final RxBool _isSpecialFeatureEnabled = RxBool(false); // Reactive variable

  bool get isSpecialFeatureEnabled => _isSpecialFeatureEnabled.value;

  void enableSpecialFeature() {
    _isSpecialFeatureEnabled.value = true;
    // Perform additional logic or network calls here
    print('Special feature enabled!'); // Placeholder for actual implementation
  }

  void disableSpecialFeature() {
    _isSpecialFeatureEnabled.value = false;
  }
}
