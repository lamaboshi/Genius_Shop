import 'package:flutter/material.dart';
import 'package:genius_shop/domain/model/product_category.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class ListCategoriesView extends StatelessWidget {
  const ListCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: InkWell(
                onTap: () {
                  controller.selectedCategory.value = Category();
                  controller.updateItemCategory();
                },
                child: Chip(
                  label: Text(
                    "All",
                    style: TextStyle(
                      color:
                          controller.selectedCategory.value.name == null
                              ? Colors.white
                              : null,
                    ),
                  ),
                  backgroundColor:
                      controller.selectedCategory.value.name == null
                          ? Colors.black87
                          : null,
                ),
              ),
            ),
            ...controller.categories.map(
              (e) => Padding(
                padding: const EdgeInsets.all(4),
                child: InkWell(
                  onTap: () {
                    controller.selectedCategory.value = e;
                    controller.updateItemCategory();
                  },
                  child: Chip(
                    label: Text(
                      e.name ?? '',
                      style: TextStyle(
                        color:
                            controller.selectedCategory.value.name == e.name
                                ? Colors.white
                                : null,
                      ),
                    ),
                    backgroundColor:
                        controller.selectedCategory.value.name == e.name
                            ? Colors.black87
                            : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
