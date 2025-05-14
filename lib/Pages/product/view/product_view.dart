import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:genius_shop/core/helper/build_context_extension.dart';
import 'package:genius_shop/core/helper/constens.dart';
import 'package:genius_shop/ui/widget/action_button.dart';
import 'package:get/get.dart';

import '../../../ui/widget/expandable_text.dart';
import '../controller/product_controller.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: context.actionBorderButtonStyle,
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          'Product Detail',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            style: context.actionBorderButtonStyle,
            onPressed: () {},
            icon: Icon(Icons.more_horiz_outlined),
          ),
        ],
      ),
      body: Obx(
        () =>
            controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          _getImageController,
                          sp20,
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
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller.product.value.slug ?? '',
                                    style: TextStyle(color: Colors.grey),
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
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sp20,
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ExpandableText(
                                text:
                                    controller.product.value.description ?? '',
                              ),

                              Column(
                                children:
                                    controller.product.value.attributes!
                                        .map(
                                          (e) => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(e.name ?? ''),
                                              Wrap(
                                                spacing: 8.0,
                                                children:
                                                    e.options!.map((option) {
                                                      return FilterChip(
                                                        label: Text(option),
                                                        selected: true,
                                                        onSelected:
                                                            (bool selected) {},
                                                      );
                                                    }).toList(),
                                              ),
                                            ],
                                          ),
                                        )
                                        .toList(),
                              ),
                              sp20,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Text(
                                            'Total Price',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            '\$${controller.product.value.price ?? 0}',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ActionButton(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.shopping_basket_outlined,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'Add To Card',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        withBorder: false,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget get _getImageController => SizedBox(
    width: Get.width - 10,
    child:
        controller.product.value.images == null ||
                controller.product.value.images!.isEmpty
            ? SizedBox()
            : CarouselSlider(
              options: CarouselOptions(
                height: Get.height / 2.5,
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items:
                  controller.product.value.images!.map((i) {
                    return Builder(
                      builder: (context) {
                        return Image.network(i.src!, fit: BoxFit.fill);
                      },
                    );
                  }).toList(),
            ),
  );
}
