import 'package:dio/dio.dart';
import 'package:genius_shop/domain/model/product.dart';
import 'package:genius_shop/domain/model/product_category.dart';
import 'package:genius_shop/main.dart';
import 'package:get/get.dart';

import '../../core/api/storage_service.dart';
import '../interfaces/products_interface.dart';

class ProductsRepository extends IProductsRepository {
  final _dio = Get.find<Dio>();

  final token = Get.find<StorageService>().getData(StorageService.authToken);
  @override
  Future<List<Product>> getAllProducts(int page, perPage) async {
    try {
      final response = await _dio.get(
        '$BASE_Endpoint/wp-json/wc/v3/products',
        queryParameters: {'page': page, 'per_page': perPage},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print(response.data);
        final data =
            response.data
                .map<Product>(
                  (json) => Product.fromMap(json as Map<String, dynamic>),
                )
                .toList();

        return data;
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Server error: ${e.response?.statusCode}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<List<Category>> getAllCategory() async {
    try {
      final response = await _dio.get(
        '$BASE_Endpoint/wp-json/wc/v3/products/categories',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print(response.data);
        final data =
            response.data
                .map<Category>(
                  (json) => Category.fromMap(json as Map<String, dynamic>),
                )
                .toList();

        return data;
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Server error: ${e.response?.statusCode}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    try {
      final response = await _dio.get(
        '$BASE_Endpoint/wp-json/wc/v3/products/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        print(response.data);
        return Product.fromMap(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Server error: ${e.response?.statusCode}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<int> fetchProductsWithPagination() async {
    try {
      final response = await _dio.get(
        '$BASE_Endpoint/wp-json/wc/v3/products',
        queryParameters: {'page': 1, 'per_page': 1},
        options: Options(
          preserveHeaderCase: true,
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final totalPages =
          int.tryParse(response.headers.value('X-WP-TotalPages') ?? '1') ?? 1;

      final result = (totalPages / 8).toInt();
      print(result);
      return result;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Server error: ${e.response?.statusCode}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
