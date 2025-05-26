import 'package:flutter/material.dart';
import 'package:genius_shop/core/api/card_service.dart';
import 'package:genius_shop/domain/model/cart.dart';
import 'package:genius_shop/domain/model/product.dart';
import 'package:genius_shop/domain/repository/products_repo.dart';
import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';

class CartController extends GetxController {
  final products = <Product>[].obs;
  final repo = ProductsRepository();
  final countMap = <int, int>{}.obs;
  final cart = Cart().obs;
  final controllerTextField = TextEditingController(text: '');
  final isLoading = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
    await getProductCart();
  }

  Future<void> getData() async {
    isLoading.value = true;
    final data = await Get.find<HomeController>().getFavorites();
    if (data != null) {
      cart.value = data;
      for (var element in data.items!) {
        getCountItem(element.id!.toString());
      }
    }
    isLoading.value = false;
  }

  Future<void> getProductCart() async {
    isLoading.value = true;
    products.clear();
    final data = await CardService.getItems();
    if (data.isEmpty) {
      isLoading.value = false;
      return;
    }
    for (var element in data) {
      getCountItem(element);

      final item = await repo.getProductById(int.parse(element));
      if (!products.any((t) => t.id == item.id)) {
        products.add(item);
      }
    }
    isLoading.value = false;
  }

  void getCountItem(String element) {
    final id = int.parse(element);
    if (countMap[id] == null) {
      countMap[id] = 1;
    }
  }

  String getTotalCost() {
    var cost = 0;
    for (var element in products) {
      cost += int.parse(element.price!) * countMap[element.id!]!;
    }
    return cost.toStringAsFixed(2);
  }

  void showHalfPageSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows full height control
      builder: (context) => widget,
    );
  }
}
