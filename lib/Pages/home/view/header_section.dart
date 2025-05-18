import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/home/view/filter/filter_dialog.dart';
import 'package:get/get.dart';
import 'package:overlayment/overlayment.dart';

import '../../../core/helper/constens.dart';
import '../../../domain/model/product_category.dart';
import '../controller/home_controller.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(
      () => Column(
        children: [
          Text(
            'welcome ${controller.user.value.userName}!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'Find Modern Furniture For Your Home',
            style: TextStyle(color: Colors.grey),
          ),
          sp10,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: controller.controllerTextField,
                      onChanged: (value) {
                        controller.searchProducts(value);
                      },
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
                  onPressed: () async {
                    controller.filter.value.categories = Category();
                    await Overlayment.show(
                      context: context,
                      OverPanel(
                        alignment: Alignment.bottomCenter,
                        child: FilterDialog(),
                      ),
                    );
                  },
                  icon: Icon(Icons.tune_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
