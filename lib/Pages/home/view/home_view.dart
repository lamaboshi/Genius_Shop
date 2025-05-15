import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/home/controller/home_controller.dart';
import 'package:genius_shop/app_router.dart';

import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.segment_rounded),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Obx(
                () => IconButton(
                  onPressed: () {
                    if (controller.pageIndex.value == 3) {
                      Get.rootDelegate.toNamed(AppRouter.editProfile);
                    }
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  icon:
                      controller.pageIndex.value == 3
                          ? Icon(Icons.edit)
                          : Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: controller.pageList[controller.pageIndex.value],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.pageIndex.value,
          selectedItemColor: Colors.black87,
          selectedFontSize: 14,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 12,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index) async {
            controller.pageIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home, size: 28),
              label: ".",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, size: 30.0),
              label: '.',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined, size: 30.0),
              label: '.',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded, size: 30.0),
              label: '.'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
