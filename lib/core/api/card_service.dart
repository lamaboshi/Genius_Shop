import 'package:genius_shop/core/api/storage_service.dart';
import 'package:genius_shop/main.dart';
import 'package:get/get.dart';

class CardService {
  static final itemsCard = 'items_card';
  static final _storage = Get.find<StorageService>();

  // Get Item list
  static Future<List<String>> getItems() async {
    return _storage.getStringList(key: itemsCard);
  }

  // Add single Item
  static Future<void> addItems(String productId) async {
    final current = List.from(await getItems());

    if (current.contains(productId)) return;
    logger.f('$productId Added');
    _storage.setStringList(key: itemsCard, values: [...current, productId]);
  }

  static Future<void> clearCard() async {
    await _storage.deleteDataByKey(itemsCard);
  }

  // Remove single Item
  static Future<bool> removeItem({
    required String key,
    required String value,
  }) async {
    // Create modifiable copy for filtering
    final current = List<String>.from(await getItems());
    return _storage.setStringList(
      key: key,
      values: current.where((item) => item != value).toList(),
    );
  }

  // Check if item in Card
  static Future<bool> isItemInCard(String productId) async {
    final items = await getItems();
    return items.contains(productId);
  }
}
