// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:genius_shop/Pages/product/view/product_title.dart'
    show ProductTitle;
import 'package:get/get.dart';

import 'package:genius_shop/core/helper/build_context_extension.dart';
import 'package:genius_shop/core/helper/constens.dart';

import '../../../ui/widget/expandable_text.dart';
import '../controller/product_controller.dart';
import 'additional_info_product.dart';

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
                      Row(
                        children: [
                          Chip(
                            label: Text(
                              controller.product.value.type!.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor:
                                controller.product.value.type!.color,
                          ),
                          sp10,
                          Chip(
                            label: Text(
                              controller.product.value.stockStatus!.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor:
                                controller.product.value.stockStatus!.color,
                          ),
                        ],
                      ),
                      _getImageController,
                      ProductTitle(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.product.value.shortDescription ?? '',
                              ),
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
                              sp10,

                              AdditionalInformationProduct(),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    controller
                                            .product
                                            .value
                                            .regularPrice!
                                            .isEmpty
                                        ? SizedBox.shrink()
                                        : _ColumnSection(
                                          title: 'Regular Price',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                          value:
                                              '\$${controller.product.value.regularPrice ?? 0}',
                                        ),
                                    _ColumnSection(
                                      title: 'Total Price',
                                      style: null,
                                      value:
                                          '\$${controller.product.value.price ?? 0}',
                                    ),
                                    Expanded(child: sp5),
                                  ],
                                ),
                              ),
                              _isShippingFree
                                  ? Text(
                                    'Shipping Free',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.lightGreen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
      floatingActionButton:
          controller.product.value.backordersAllowed == null ||
                  controller.product.value.backordersAllowed!
              ? SizedBox.shrink()
              : FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: Colors.black87,
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_basket_outlined, color: Colors.white),
                    sp10,
                    Text('Add To Card', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
    );
  }

  bool get _isShippingFree =>
      controller.product.value.shippingRequired! &&
              controller.product.value.shippingClassId == 0
          ? true
          : false;

  Widget get _getImageController => SizedBox(
    width: Get.width - 10,
    child:
        controller.product.value.images == null ||
                controller.product.value.images!.isEmpty
            ? SizedBox()
            : CarouselSlider(
              options: CarouselOptions(
                height: Get.height / 3,
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

class _ColumnSection extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? style;
  const _ColumnSection({
    required this.title,
    required this.style,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(title, style: TextStyle(color: Colors.grey)),
          Text(
            value,
            style:
                style == null
                    ? TextStyle(fontSize: 16, color: Colors.black87)
                    : style!.copyWith(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
