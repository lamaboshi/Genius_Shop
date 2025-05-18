import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/product/controller/product_controller.dart';
import 'package:get/get.dart';

import '../../../core/helper/constens.dart';

class AdditionalInformationProduct extends StatelessWidget {
  AdditionalInformationProduct({super.key});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isCategoriesEmpty
            ? SizedBox.shrink()
            : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  children:
                      controller.product.value.categories!
                          .map((t) => Chip(label: Text(t.name ?? '')))
                          .toList(),
                ),
              ],
            ),

        sp5,
        controller.product.value.tags == null ||
                controller.product.value.tags!.isEmpty
            ? SizedBox.shrink()
            : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tags',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  children:
                      controller.product.value.tags!
                          .map((t) => Chip(label: Text(t.name)))
                          .toList(),
                ),
              ],
            ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Available from this product : ',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '${controller.product.value.stockQuantity ?? 0} pice',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        _RowDimensions(
          title: 'Weight',
          value: '${controller.product.value.weight ?? 0} kg',
        ),
        _RowDimensions(
          title: 'Dimensions',
          value:
              '${controller.product.value.dimensions!.height ?? 0} × ${controller.product.value.dimensions!.width ?? 0} × ${controller.product.value.dimensions!.length ?? 0} cm',
        ),

        Column(
          children:
              controller.product.value.attributes!
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.name ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Wrap(
                            spacing: 8.0,
                            children:
                                e.options!.map((option) {
                                  return FilterChip(
                                    label: Text(option),
                                    selected: true,
                                    onSelected: (bool selected) {},
                                  );
                                }).toList(),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }

  bool get isCategoriesEmpty =>
      controller.product.value.categories == null ||
      controller.product.value.categories!.isEmpty;
}

class _RowDimensions extends StatelessWidget {
  final String title;
  final String value;
  const _RowDimensions({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),

          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
