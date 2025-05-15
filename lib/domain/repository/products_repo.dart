import 'package:dio/dio.dart';
import 'package:genius_shop/domain/model/default_attributes.dart';
import 'package:genius_shop/domain/model/product.dart';
import 'package:genius_shop/domain/model/product_attribute.dart';
import 'package:genius_shop/domain/model/product_category.dart';
import 'package:genius_shop/main.dart';
import 'package:get/get.dart';

import '../../core/api/storage_service.dart';
import '../../core/helper/dio_api_handler.dart';
import '../interfaces/products_interface.dart';

class ProductsRepository extends IProductsRepository {
  final _dio = Get.find<Dio>();

  final token = Get.find<StorageService>().getData(StorageService.authToken);
  @override
  Future<List<Product>> getAllProducts(int page, perPage) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.get(
            '$BASE_Endpoint/wp-json/wc/v3/products',
            queryParameters: {'page': page, 'per_page': perPage},
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Fetch Products',
    );
    if (response.data == null) return [];
    final data =
        response.data
            .map<Product>(
              (json) => Product.fromMap(json as Map<String, dynamic>),
            )
            .toList();

    return data;
  }

  @override
  Future<List<Category>> getAllCategory() async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.get(
            '$BASE_Endpoint/wp-json/wc/v3/products/categories',
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Fetch Categories',
    );

    final data =
        response.data
            .map<Category>(
              (json) => Category.fromMap(json as Map<String, dynamic>),
            )
            .toList();

    return data;
  }

  @override
  Future<Product> getProductById(int id) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.get(
            '$BASE_Endpoint/wp-json/wc/v3/products/$id',
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Fetch getProductById',
    );

    return Product.fromMap(response.data as Map<String, dynamic>);
  }

  @override
  Future<int> fetchProductsWithPagination() async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.get(
            '$BASE_Endpoint/wp-json/wc/v3/products',
            queryParameters: {'page': 1, 'per_page': 1},
            options: Options(
              preserveHeaderCase: true,
              headers: {'Authorization': 'Bearer $token'},
            ),
          ),
      operationName: 'Fetch fetchProductsWithPagination',
    );
    final totalPages =
        int.tryParse(response.headers.value('X-WP-TotalPages') ?? '1') ?? 1;

    final result = (totalPages / 8).toInt();

    return result;
  }

  @override
  Future<List<Attribute>> getAllAttribute() async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.get(
            '$BASE_Endpoint/wp-json/wc/v3/products/attributes',
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Fetch getAllAttribute',
    );
    if (response.data == null) return [];
    final data =
        response.data
            .map<Attribute>(
              (json) => Attribute.fromMap(json as Map<String, dynamic>),
            )
            .toList();

    return data;
  }

  @override
  Future<List<DefaultAttribute>> getAllDefaultAttribute(int id) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.get(
            '$BASE_Endpoint/wp-json/wc/v3/products/attributes/$id/terms',
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Fetch getAllDefaultAttribute',
    );
    if (response.data == null) return [];
    final data =
        response.data
            .map<DefaultAttribute>(
              (json) => DefaultAttribute.fromMap(json as Map<String, dynamic>),
            )
            .toList();

    return data;
  }
}
