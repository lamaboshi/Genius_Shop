import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/product/controller/product_controller.dart';
import 'package:genius_shop/domain/model/product.dart';
import 'package:get/get.dart';

final controller = Get.find<ProductController>();

class TypeProductWidget extends StatelessWidget {
  const TypeProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => switch (controller.product.value.type) {
        null => SizedBox(),
        ProductType.external => SizedBox(),
        ProductType.variable => _VariableProduct(),
        ProductType.simple => _SimpleProduct(),
        ProductType.grouped => _GroupedProduct(),
      },
    );
  }
}

class _VariableProduct extends StatelessWidget {
  const _VariableProduct();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
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
                                  selected: controller.isOptionSelected(
                                    e,
                                    option,
                                  ),
                                  onSelected: (value) {},
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}

class _SimpleProduct extends StatelessWidget {
  const _SimpleProduct();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                                selected: false,
                                onSelected: null,
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }
}

class _GroupedProduct extends StatelessWidget {
  const _GroupedProduct();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
