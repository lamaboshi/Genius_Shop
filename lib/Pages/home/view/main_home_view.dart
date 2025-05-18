import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/home/controller/home_controller.dart';
import 'package:get/get.dart';

import 'header_section.dart';
import 'product_secation/list_categories_view.dart';
import 'product_secation/list_product_view.dart';
import 'product_secation/product_pagination.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(),
        Column(
          children: [
            ListCategoriesView(isFilter: false),
            Obx(
              () => ProductPagination(
                currentPage: controller.currentPage.value,
                totalPages: controller.totalPages.value,
                onPageChanged: (value) async {
                  if (value != controller.currentPage.value) {
                    controller.currentPage.value = value;
                    await controller.getProductByPage(value);
                  }
                },
                isLoading: false,
              ),
            ),
          ],
        ),
        Expanded(child: ListProductView()),
      ],
    );
  }
}
