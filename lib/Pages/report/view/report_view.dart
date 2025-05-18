import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/report/controller/report_controller.dart';
import 'package:genius_shop/core/helper/build_context_extension.dart';
import 'package:get/get.dart';

import '../../../core/helper/constens.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReportController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
          style: context.actionBorderButtonStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Report',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            sp20,
            Obx(
              () =>
                  controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Column(
                        children:
                            controller.report
                                .map(
                                  (f) => Card(
                                    child: ListTile(
                                      title: Text(f.slug ?? ""),
                                      subtitle: Text(f.description ?? ''),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
