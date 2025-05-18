// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:genius_shop/domain/model/product_category.dart';

import '../../controller/home_controller.dart';

class ListCategoriesView extends StatelessWidget {
  final bool isFilter;
  const ListCategoriesView({super.key, this.isFilter = false});

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
                  if (isFilter) {
                    controller.filter.value.categories = Category();
                    controller.filter.refresh();
                  } else {
                    controller.selectedCategory.value = Category();
                    controller.updateItemCategory();
                  }
                },
                child: Chip(
                  label: Text(
                    "All",
                    style: TextStyle(color: getIsFilter ? Colors.white : null),
                  ),
                  backgroundColor: getIsFilter ? Colors.black87 : null,
                ),
              ),
            ),
            ...controller.categories.map(
              (e) => Padding(
                padding: const EdgeInsets.all(4),
                child: InkWell(
                  onTap: () {
                    if (isFilter) {
                      controller.filter.value.categories = e;
                      controller.filter.refresh();
                      print(controller.filter.value.categories!.name);
                    } else {
                      controller.selectedCategory.value = e;
                      controller.updateItemCategory();
                    }
                  },
                  child: Chip(
                    label: Text(
                      e.name ?? '',
                      style: TextStyle(
                        color: getIsSelection(e.name!) ? Colors.white : null,
                      ),
                    ),
                    backgroundColor:
                        getIsSelection(e.name!) ? Colors.black87 : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get getIsFilter =>
      isFilter &&
              (Get.find<HomeController>().filter.value.categories == null ||
                  Get.find<HomeController>().filter.value.categories!.name ==
                      null)
          ? true
          : !isFilter &&
              Get.find<HomeController>().selectedCategory.value.name == null
          ? true
          : false;
  bool getIsSelection(String name) =>
      isFilter &&
              Get.find<HomeController>().filter.value.categories != null &&
              Get.find<HomeController>().filter.value.categories!.name == name
          ? true
          : Get.find<HomeController>().selectedCategory.value.name == name
          ? true
          : false;
}
