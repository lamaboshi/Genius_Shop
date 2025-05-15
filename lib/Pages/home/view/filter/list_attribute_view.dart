import 'package:flutter/material.dart';
import 'package:genius_shop/domain/model/default_attributes.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class ListAttributeView extends StatelessWidget {
  final List<DefaultAttribute> items;
  const ListAttributeView({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children:
              items
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: InkWell(
                        onTap: () {
                          if (controller.selectedAttribute.any(
                            (t) => t.name == e.name,
                          )) {
                            controller.selectedAttribute.remove(e);
                          } else {
                            controller.selectedAttribute.add(e);
                          }
                        },
                        child: Chip(
                          label: Text(
                            e.name ?? '',
                            style: TextStyle(
                              color:
                                  controller.selectedAttribute.any(
                                        (t) => t.id == e.id,
                                      )
                                      ? Colors.white
                                      : null,
                            ),
                          ),
                          backgroundColor:
                              controller.selectedAttribute.any(
                                    (t) => t.id == e.id,
                                  )
                                  ? Colors.black87
                                  : null,
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
