import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/home/controller/home_controller.dart';
import 'package:genius_shop/Pages/home/view/list_product_view.dart';
import 'package:genius_shop/core/helper/constens.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.segment_rounded),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              icon: Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Text(
                      'welcome ${controller.user.value.userName}!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Find Modern Furniture For Your Home',
                      style: TextStyle(color: Colors.grey),
                    ),
                    sp20,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey[100],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: 'Search here...',
                                  icon: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.tune_rounded),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(flex: 4, child: ListProductView()),
            ],
          ),
        ),
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
    );
  }
}
