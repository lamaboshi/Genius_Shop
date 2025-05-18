import 'package:genius_shop/Pages/report/controller/report_controller.dart';
import 'package:get/get.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReportController());
  }
}
