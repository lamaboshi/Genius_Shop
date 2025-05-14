import 'package:flutter/cupertino.dart';
import 'package:genius_shop/domain/model/product.dart';
import 'package:genius_shop/domain/model/product_category.dart';
import 'package:genius_shop/domain/repository/auth_repo.dart';
import 'package:genius_shop/domain/repository/products_repo.dart';
import 'package:get/get.dart';

import '../../../domain/model/user.dart';
import '../view/list_product_view.dart';

class HomeController extends GetxController {
  final authRepo = AuthRepository();
  final repo = ProductsRepository();
  final user = User().obs;
  final products = <Product>[].obs;
  final categories = <Category>[].obs;
  final isLoading = false.obs;
  final isLoadingProduct = false.obs;
  final pageIndex = 0.obs;
  final totalPages = 0.obs;
  final currentPage = 1.obs;
  final selectedCategory = Category(name: null).obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    getUser();
    await getAllProducts();
    await getAllCategory();
    isLoading.value = false;
  }

  void getUser() {
    final data = authRepo.getUserData();
    if (data != null) {
      user.value = data;
    }
  }

  Future<void> getAllProducts() async {
    isLoadingProduct.value = true;

    totalPages.value = await repo.fetchProductsWithPagination();
    print('Total pages needed: $totalPages');
    await getProductByPage(1);
  }

  Future<void> getProductByPage(int page) async {
    isLoadingProduct.value = true;
    final data = await repo.getAllProducts(page, 8);
    if (data.isEmpty) return;
    data.shuffle();
    products.assignAll(data);
    isLoadingProduct.value = false;
  }

  Future<void> updateItemCategory() async {
    await getAllProducts();
    if (selectedCategory.value.name == null) return;
    var data =
        products
            .where(
              (t) => t.categories!.any(
                (r) => r.name == selectedCategory.value.name,
              ),
            )
            .toList();
    products.assignAll(data);
    products.refresh();
  }

  Future<void> getAllCategory() async {
    final data = await repo.getAllCategory();
    if (data.isEmpty) return;

    categories.assignAll(data);
  }

  final pageList = [
    const ListProductView(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];
}
