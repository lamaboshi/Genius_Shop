import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:genius_shop/Pages/favorites/controller/favorites_controller.dart';
import 'package:genius_shop/core/helper/build_context_extension.dart';
import 'package:genius_shop/domain/model/item_cart.dart';
import 'package:get/get.dart';

import '../../../core/helper/constens.dart';

class ItemFavorites extends StatelessWidget {
  final ItemCart item;
  const ItemFavorites({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoritesController>();
    return Padding(
      padding: EdgeInsets.all(12),
      child: Slidable(
        key: ValueKey(item.id),

        endActionPane: ActionPane(
          motion: ScrollMotion(),
          dismissible: DismissiblePane(
            onDismissed: () async {
              await controller.removeItem(item.item_key!);
            },
          ),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: (_) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Row(
          children: [
            // Product Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
                image:
                    item.featured_image != null
                        ? DecorationImage(
                          image: NetworkImage(item.featured_image!),
                          fit: BoxFit.cover,
                        )
                        : null,
              ),
            ),
            SizedBox(width: 16),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.name ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            style: context.actionBorderButtonStyle,
                            onPressed: () async {
                              controller.countMap[item.id!] =
                                  controller.countMap[item.id!]! + 1;
                              await controller.updateCart(
                                item.item_key!,
                                controller.countMap[item.id!].toString(),
                              );
                            },
                            icon: Icon(Icons.plus_one_outlined, size: 15),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            style: context.actionBorderButtonStyle,
                            onPressed: () async {
                              if (controller.countMap[item.id!]! > 1) {
                                controller.countMap[item.id!] =
                                    controller.countMap[item.id!]! - 1;
                                await controller.updateCart(
                                  item.item_key!,
                                  controller.countMap[item.id!].toString(),
                                );
                              }
                            },
                            icon: Icon(Icons.exposure_minus_1, size: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // if (item. != null || item.attributes!.isNotEmpty)
                  //   ...item.attributes!.map(
                  //     (e) => Row(
                  //       children: [
                  //         Text('${e.name ?? ""} :'),
                  //         if (e.options != null)
                  //           ...e.options!.map(
                  //             (t) =>
                  //                 Text(t, style: TextStyle(color: Colors.grey)),
                  //           ),
                  //       ],
                  //     ),
                  //   ),
                  sp5,
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${_getPrice(item.price!, controller.countMap[item.id!]!)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text('x${controller.countMap[item.id!]!}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getPrice(String price, int count) => (int.parse(price) * count);
}
