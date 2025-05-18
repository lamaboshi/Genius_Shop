import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/home/controller/home_controller.dart';
import 'package:genius_shop/Pages/home/view/product_secation/list_categories_view.dart';
import 'package:genius_shop/core/helper/build_context_extension.dart';
import 'package:genius_shop/core/helper/constens.dart';
import 'package:genius_shop/ui/widget/action_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:overlayment/overlayment.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'list_attribute_view.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              TextButton(
                style: context.actionBorderButtonStyle,
                onPressed: () {
                  Overlayment.dismissLast();
                  controller.filter.value = ProductFilter();
                  controller.products.assignAll(controller.basedProducts);
                },
                child: Text('Clear Filter'),
              ),
            ],
          ),
          sp20,
          Text(
            'Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListCategoriesView(isFilter: true),
          sp20,
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  controller.attribute
                      .map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.attribute!.name ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ListAttributeView(items: e.listAttribute!),
                          ],
                        ),
                      )
                      .toList(),
            ),
          ),
          Text(
            'price Range',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfRangeSliderTheme(
              data: SfRangeSliderThemeData(
                activeTrackColor: Colors.black,
                inactiveTrackColor: Colors.grey[300],
                thumbColor: Colors.white,
                activeLabelStyle: const TextStyle(color: Colors.black87),
                inactiveLabelStyle: TextStyle(color: Colors.grey[500]),
                overlayColor: Colors.black.withOpacity(0.1),
                tooltipBackgroundColor: Colors.black,
              ),
              child: Obx(
                () => SfRangeSlider(
                  min: 0.0,
                  max: 500.0,
                  interval: 50,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
                  onChanged: (value) {
                    controller.priceRange.value = value;
                  },
                  values: controller.priceRange.value,
                ),
              ),
            ),
          ),
          sp20,
          sp20,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ActionButton(
              title: Text(
                'Apply Filter',
                style: TextStyle(color: Colors.white),
              ),
              withBorder: false,
              onPressed: () {
                controller.applyFilters(
                  filter: ProductFilter(
                    categories: controller.selectedCategory.value,
                    attributes: controller.selectedAttribute,
                    priceRange: controller.priceRange.value,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
