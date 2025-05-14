import 'package:genius_shop/domain/model/product.dart';
import 'package:genius_shop/domain/repository/products_repo.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductController extends GetxController {
  final product = Product().obs;
  final repo = ProductsRepository();
  final arguments = Get.rootDelegate.arguments() as Map<String, dynamic>?;
  final isLoading = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    final productId = arguments?['id'];
    await getProduct(productId);
  }

  Future<void> getProduct(int id) async {
    isLoading.value = true;
    product.value = await repo.getProductById(id);
    isLoading.value = false;
  }

  String htmlToPlainText(String htmlString) {
    final document = HtmlParser.parseHTML(htmlString);
    return document.innerHtml + document.outerHtml;
  }
}
