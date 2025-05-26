import 'package:genius_shop/Pages/home/controller/home_controller.dart';
import 'package:genius_shop/domain/model/cart.dart';
import 'package:get/get.dart';

import '../../../domain/repository/cart_repo.dart';

class FavoritesController extends GetxController {
  final isLoading = false.obs;
  final repo = CartRepository();
  final cart = Cart().obs;
  final countMap = <int, int>{}.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    await getData();
    isLoading.value = false;
  }

  Future<void> getData() async {
    final data = await Get.find<HomeController>().getFavorites();
    if (data != null) {
      cart.value = data;
      for (var element in data.items!) {
        getCountItem(element.id!.toString());
      }
    }
  }

  void getCountItem(String element) {
    final id = int.parse(element);
    if (countMap[id] == null) {
      countMap[id] = 1;
    }
  }

  Future<void> updateCart(String itemKey, String quantity) async {
    final result = await repo.updateCart(itemKey, quantity);
    if (result) {
      await getData();
    }
  }

  Future<void> removeItem(String itemKey) async {
    final result = await repo.removeFormCart(itemKey);
    if (result) {
      await getData();
    }
  }
}
