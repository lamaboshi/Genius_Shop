import 'package:genius_shop/domain/model/product.dart';
import 'package:genius_shop/domain/model/product_category.dart';

abstract class IProductsRepository {
  Future<int> fetchProductsWithPagination();
  Future<List<Product>> getAllProducts(int page, perPage);
  Future<List<Category>> getAllCategory();
  Future<Product> getProductById(int id);
}
