import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/product/controller/product_controller.dart';
import 'package:genius_shop/core/helper/build_context_extension.dart';
import 'package:get/get.dart';

import '../../../core/helper/constens.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox.shrink(),
            controller.product.value.onSale!
                ? Chip(
                  label: Text('On Sale', style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.blueGrey,
                )
                : SizedBox.shrink(),
          ],
        ),
        sp20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.product.value.name ?? '',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      controller.product.value.slug ?? '',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      ' (${controller.product.value.sku ?? ''})',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              style: context.actionBorderButtonStyle,
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ],
        ),
      ],
    );
  }
}
