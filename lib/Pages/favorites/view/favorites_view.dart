import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/favorites/controller/favorites_controller.dart';
import 'package:genius_shop/Pages/favorites/view/item_favorites.dart';
import 'package:get/get.dart';

import '../../../core/helper/constens.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoritesController>();
    return Column(
      children: [
        Column(
          children: [
            Center(child: Text('Favorites', style: styleTitle)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Item in cart: ${controller.cart.value.items!.length}',
                  style: styleTitle,
                ),
                SizedBox(),
              ],
            ),
          ],
        ),
        sp10,
        Expanded(
          flex: 2,
          child: Obx(
            () =>
                controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                      child: Wrap(
                        children:
                            controller.cart.value.items!
                                .map((e) => ItemFavorites(item: e))
                                .toList(),
                      ),
                    ),
          ),
        ),
      ],
    );
  }
}
