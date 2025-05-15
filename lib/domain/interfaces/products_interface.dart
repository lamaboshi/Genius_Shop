import 'package:genius_shop/domain/model/default_attributes.dart';
import 'package:genius_shop/domain/model/product.dart';
import 'package:genius_shop/domain/model/product_category.dart';

import '../model/product_attribute.dart';

abstract class IProductsRepository {
  Future<int> fetchProductsWithPagination();
  Future<List<Product>> getAllProducts(int page, perPage);
  Future<List<Category>> getAllCategory();
  Future<List<Attribute>> getAllAttribute();
  Future<List<DefaultAttribute>> getAllDefaultAttribute(int id);
  Future<Product> getProductById(int id);
}
