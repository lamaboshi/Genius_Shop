import 'package:genius_shop/domain/model/add_to_cart.dart';
import 'package:genius_shop/domain/model/product.dart';
import 'package:genius_shop/domain/model/product_attribute.dart';
import 'package:genius_shop/domain/model/variations.dart';
import 'package:genius_shop/domain/repository/cart_repo.dart';
import 'package:genius_shop/domain/repository/products_repo.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final product = Product().obs;
  final repo = ProductsRepository();
  final repoCart = CartRepository();
  final arguments = Get.rootDelegate.arguments() as Map<String, dynamic>?;
  final isLoading = false.obs;
  final variations = <VariationProduct>[].obs;
  final selectedAttribute = <Attribute>[].obs;
  final productId = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    productId.value = arguments?['id'];
    await getProduct(productId.value);
    await getVariations();
  }

  Future<void> getProduct(int id) async {
    isLoading.value = true;
    product.value = await repo.getProductById(id);
    isLoading.value = false;
  }

  Future<void> getVariations() async {
    final result = await repo.getVariations(productId.value.toString());
    if (result.isNotEmpty) {
      variations.assignAll(result);
    }
  }

  Future<void> addFavorites(Product? item) async {
    var data = false;

    switch (item!.type) {
      case ProductType.simple:
        data = await repoCart.addToCart(
          AddToCart()
            ..id = item.id.toString()
            ..quantity = '1',
        );
        break;
      case ProductType.grouped:
        data = await repoCart.addToCartGrouped(
          AddToCart()
            ..id = item.id.toString()
            ..quantityGrouped = {},
        );
        break;
      case ProductType.variable:
        data = await repoCart.addToCartVariable(
          AddToCart()
            ..id = item.id.toString()
            ..quantity = '1',
        );
        break;
      default:
    }
    if (data) {}
  }

  bool isOptionSelected(Attribute attribute, String option) {
    if (variations.isEmpty) return false;
    var result = false;
    for (final variation in variations) {
      final matchingAttribute = variation.attributes!.firstWhere(
        (attr) => attr.name == attribute.name,
      );

      result = matchingAttribute.option == option;
    }
    return result;
  }
}
