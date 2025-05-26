// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:genius_shop/Pages/home/controller/home_controller.dart';
import 'package:genius_shop/domain/repository/cart_repo.dart';
import 'package:genius_shop/ui/widget/action_button.dart';
import 'package:get/get.dart';

import 'package:genius_shop/Pages/cart_page/controller/cart_controller.dart';
import 'package:genius_shop/core/helper/build_context_extension.dart';
import 'package:genius_shop/domain/model/product.dart';

import '../../../core/helper/constens.dart';
import '../../favorites/view/item_favorites.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Center(child: Text('Cart', style: styleTitle)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Item in cart: ${Get.find<HomeController>().countItem.value}',
                    style: styleTitle,
                  ),
                  SizedBox(),
                ],
              ),
            ],
          ),
          Flexible(
            flex: 3,
            child: Obx(
              () =>
                  controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                        child: Column(
                          children: [
                            ...controller.products.map(
                              (e) => _ItemsCard(item: e),
                            ),
                            Text(
                              'Favorites',
                              style: TextStyle(color: Colors.grey),
                            ),
                            ...controller.cart.value.items!.map(
                              (e) => ItemFavorites(item: e),
                            ),
                          ],
                        ),
                      ),
            ),
          ),

          Flexible(
            child: Column(
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                sp10,
                Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.paypal_sharp),
                    title: Text('Paypal'),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
                sp10,
                ActionButton(
                  title: Text(
                    'CheckOut',
                    style: TextStyle(color: Colors.white),
                  ),
                  withBorder: false,
                  onPressed: () async {
                    await CartRepository().getCarts();
                    //  controller.showHalfPageSheet(context, CheckOutDetails());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemsCard extends StatelessWidget {
  final Product item;
  const _ItemsCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();
    return Padding(
      padding: EdgeInsets.all(12),
      child: Slidable(
        key: ValueKey(item.id),

        endActionPane: ActionPane(
          motion: ScrollMotion(),
          dismissible: DismissiblePane(
            onDismissed: () {
              Get.find<CartController>().products.remove(item);
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
                    item.images != null &&
                            item.images!.isNotEmpty &&
                            item.images!.first.src != null
                        ? DecorationImage(
                          image: NetworkImage(item.images!.first.src!),
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
                            onPressed: () {
                              controller.countMap[item.id!] =
                                  controller.countMap[item.id!]! + 1;
                            },
                            icon: Icon(Icons.plus_one_outlined, size: 15),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            style: context.actionBorderButtonStyle,
                            onPressed: () {
                              if (controller.countMap[item.id!]! > 1) {
                                controller.countMap[item.id!] =
                                    controller.countMap[item.id!]! - 1;
                              }
                            },
                            icon: Icon(Icons.exposure_minus_1, size: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (item.attributes != null || item.attributes!.isNotEmpty)
                    ...item.attributes!.map(
                      (e) => Row(
                        children: [
                          Text('${e.name ?? ""} :'),
                          if (e.options != null)
                            ...e.options!.map(
                              (t) =>
                                  Text(t, style: TextStyle(color: Colors.grey)),
                            ),
                        ],
                      ),
                    ),
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
