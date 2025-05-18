import 'package:genius_shop/domain/repository/report_repo.dart';
import 'package:get/get.dart';

import '../../../domain/model/report.dart';

class ReportController extends GetxController {
  final report = <Report>[].obs;
  final repo = ReportRepository();
  final isLoading = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    final data = await repo.getAllReport();
    if (data == null || data.isEmpty) return;
    report.assignAll(data);
    isLoading.value = false;
  }
}
