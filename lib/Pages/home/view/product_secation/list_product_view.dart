import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/home/controller/home_controller.dart';
import 'package:genius_shop/app_router.dart';
import 'package:genius_shop/domain/model/product.dart';
import 'package:get/get.dart';

import '../../../../core/api/card_service.dart';

class ListProductView extends StatelessWidget {
  const ListProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(
      () =>
          controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child:
                    controller.isLoadingProduct.value
                        ? CircularProgressIndicator()
                        : Wrap(
                          children:
                              controller.products
                                  .map(
                                    (e) => InkWell(
                                      onTap: () {
                                        Get.rootDelegate.toNamed(
                                          AppRouter.product,
                                          arguments: {'id': e.id},
                                        );
                                      },
                                      child: ProductCard(item: e),
                                    ),
                                  )
                                  .toList(),
                        ),
              ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product item;
  const ProductCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            elevation: 0,
            child: SizedBox(
              width: Get.width / 2.6,
              height: Get.height / 4,
              child: Stack(
                children: [
                  item.images == null || item.images!.isEmpty
                      ? Container()
                      : Image.network(
                        item.images!.first.src!,
                        fit: BoxFit.fill,
                        width: Get.width / 2.6,
                        height: Get.height / 4,
                      ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () async {
                          await CardService.addItems(item.id.toString());

                          Get.find<HomeController>().updateCountCard();
                        },
                        child: Card(
                          elevation: 0,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Icon(Icons.shopping_bag_outlined),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                            color: Colors.red[900],
                          ),
                        ),
                      ),
                    ),
                  ),
                  item.onSale!
                      ? Padding(
                        padding: const EdgeInsets.all(4),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Card(
                            elevation: 0,
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Text(
                                '!Sale',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
          Text(item.name ?? '', style: TextStyle(fontWeight: FontWeight.w500)),
          Text(
            '\$${item.price ?? 0}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
