import 'package:dio/dio.dart';
import 'package:genius_shop/core/api/storage_service.dart';
import 'package:genius_shop/domain/model/cart.dart';
import 'package:genius_shop/main.dart';
import 'package:get/get.dart';

import '../../core/helper/dio_api_handler.dart';
import '../interfaces/cart_interface.dart';
import '../model/add_to_cart.dart';

class CartRepository extends ICartRepository {
  final _dio = Get.find<Dio>();

  final token = Get.find<StorageService>().getData(StorageService.authToken);

  @override
  Future<Cart?> getCarts() async {
    logger.d(token);
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.get(
            '$BASE_Endpoint/wp-json/cocart/v2/cart',
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Fetch Cart',
    );
    Get.find<StorageService>().saveData(
      StorageService.cartId,
      response.data['cart_key'],
    );
    logger.i(Get.find<StorageService>().getData(StorageService.cartId));

    return Cart.fromMap(response.data as Map<String, dynamic>);
  }

  @override
  Future<bool> addToCart(AddToCart? cart) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.post(
            '$BASE_Endpoint/wp-json/cocart/v2/cart/add-item',

            data: cart?.toMap(),
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Post Item to cart',
    );
    return response.statusCode == 200;
  }

  @override
  Future<bool> addToCartGrouped(AddToCart cart) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.post(
            '$BASE_Endpoint/wp-json/cocart/v2/cart/add-items',

            data: cart.toMapGrouped(),
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Post Item to cart Grouped',
    );
    return response.statusCode == 200;
  }

  @override
  Future<bool> addToCartVariable(AddToCart cart) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.post(
            '$BASE_Endpoint/wp-json/cocart/v2/cart/add-items',

            data: cart.toMapVariable(),
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Post Item to cart Variable',
    );
    return response.statusCode == 200;
  }

  @override
  Future<bool> updateCart(String itemKey, String quantity) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.put(
            '$BASE_Endpoint/wp-json/cocart/v2/cart/item/$itemKey',

            data: {'quantity': quantity},
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Update Item to cart',
    );
    return response.statusCode == 200;
  }

  @override
  Future<bool> removeFormCart(String itemKey) async {
    final response = await DioApiHandler.execute(
      apiCall:
          () => _dio.delete(
            '$BASE_Endpoint/wp-json/cocart/v2/cart/item/$itemKey',
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          ),
      operationName: 'Delete Item to cart',
    );
    return response.statusCode == 200;
  }
}
