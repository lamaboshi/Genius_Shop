import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LogInController());
  }
}
