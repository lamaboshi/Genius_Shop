import 'package:genius_shop/domain/model/add_to_cart.dart';
import 'package:genius_shop/domain/model/cart.dart';

abstract class ICartRepository {
  Future<Cart?> getCarts();
  Future<bool> addToCart(AddToCart cart);
  Future<bool> addToCartVariable(AddToCart cart);
  Future<bool> addToCartGrouped(AddToCart cart);
  Future<bool> updateCart(String itemKey, String quantity);
  Future<bool> removeFormCart(String itemKey);
}
