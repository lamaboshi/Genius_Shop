// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:genius_shop/core/api/card_service.dart';
import 'package:get/get.dart';
import 'package:overlayment/overlayment.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:genius_shop/domain/model/attributes.dart';
import 'package:genius_shop/domain/model/default_attributes.dart';
import 'package:genius_shop/domain/model/product.dart';
import 'package:genius_shop/domain/model/product_category.dart';
import 'package:genius_shop/domain/repository/auth_repo.dart';
import 'package:genius_shop/domain/repository/products_repo.dart';

import '../../../domain/model/user.dart';
import '../../profile/view/profile_view.dart';
import '../view/main_home_view.dart';

class HomeController extends GetxController {
  final authRepo = AuthRepository();
  final repo = ProductsRepository();

  final user = User().obs;
  final products = <Product>[].obs;
  final basedProducts = <Product>[].obs;
  final searchResults = <Product>[].obs;
  final categories = <Category>[].obs;
  final attribute = <ProductAttribute>[].obs;
  final selectedAttribute = <DefaultAttribute>[].obs;

  final isLoading = false.obs;
  final isLoadingProduct = false.obs;
  final pageIndex = 0.obs;
  final totalPages = 0.obs;
  final currentPage = 1.obs;

  final selectedCategory = Category(name: null).obs;
  final filter = ProductFilter().obs;
  final priceRange = SfRangeValues(20.0, 80.0).obs;
  final countItem = 0.obs;

  final controllerTextField = TextEditingController(text: '');
  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    getUser();
    await getAllProducts();
    await getAllCategory();
    await getAllAttribute();
    updateCountCard();
    isLoading.value = false;
  }

  Future<void> updateCountCard() async {
    final count = await CardService.getItems();
    countItem.value = count.length;
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
    basedProducts.assignAll(data);
    isLoadingProduct.value = false;
  }

  Future<void> updateItemCategory() async {
    if (selectedCategory.value.name == null) {
      products.assignAll(basedProducts);
      return;
    }
    var data =
        basedProducts
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

  Future<void> getAllAttribute() async {
    attribute.clear();
    final data = await repo.getAllAttribute();
    if (data.isEmpty) return;
    for (var element in data) {
      var subList = await repo.getAllDefaultAttribute(element.id!);
      attribute.add(
        ProductAttribute(attribute: element, listAttribute: subList),
      );
    }
  }

  Future<void> searchProducts(String query) async {
    isLoadingProduct.value = true;

    if (query.isEmpty) {
      products.assignAll(basedProducts);
      isLoadingProduct.value = false;
      return;
    }

    final results =
        basedProducts.where((product) {
          final nameLower = product.name!.toLowerCase();
          final queryLower = query.toLowerCase();

          return nameLower.contains(queryLower) ||
              product.slug!.toLowerCase().contains(queryLower) ||
              product.categories!.any(
                (t) => t.name!.toLowerCase().contains(queryLower),
              );
        }).toList();

    products.assignAll(results);
    isLoadingProduct.value = false;
  }

  Future<void> applyFilters({required ProductFilter filter}) async {
    Overlayment.dismissLast();
    //filterCategory
    final filteredCategory =
        basedProducts.where((product) {
          var categoryMatch = true;
          if (filter.categories != null && filter.categories!.name != null) {
            categoryMatch =
                product.categories?.any(
                  (t) => t.name == filter.categories!.name,
                ) ??
                false;
          }
          return categoryMatch;
        }).toList();

    print('${filteredCategory.length}');
    //filterAttributes
    final filteredAttribute =
        filteredCategory.where((product) {
          final attributeMatch =
              filter.attributes == null ||
              filter.attributes!.isEmpty ||
              filter.attributes!.every(
                (attr) =>
                    product.attributes?.any(
                      (productAttr) =>
                          productAttr.options?.any(
                            (option) => option == attr.name,
                          ) ??
                          false,
                    ) ??
                    false,
              );
          return attributeMatch;
        }).toList();

    print('${filteredAttribute.length}');

    //filterPrice
    final filteredItem =
        filteredAttribute.where((product) {
          final priceMatch =
              product.price != null &&
              double.tryParse(product.price!) != null &&
              double.parse(product.price!) >= priceRange.value.start &&
              double.parse(product.price!) <= priceRange.value.end;
          return priceMatch;
        }).toList();

    print('${filteredItem.length}');

    products.assignAll(filteredItem);
  }

  final pageList = [
    const MainHomeView(),
    SizedBox(),
    SizedBox(),
    ProfileView(),
  ];
}

class ProductFilter {
  Category? categories;
  List<DefaultAttribute>? attributes;
  SfRangeValues? priceRange;
  ProductFilter({this.categories, this.attributes, this.priceRange});
}
