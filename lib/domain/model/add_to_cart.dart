// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:genius_shop/domain/model/item_cart.dart';

class AddToCart {
  String? id;
  String? quantity;
  Map<String, String>? quantityGrouped;
  List<ItemCart>? item_data;
  bool? return_items;
  AddToCart({
    this.id,
    this.quantity,
    this.quantityGrouped,
    this.item_data,
    this.return_items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'quantity': quantity};
  }

  Map<String, dynamic> toMapVariable() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      "variation": {
        "attribute_colours": "Red",
        "attribute_pa_size": "2x-large",
      },
    };
  }

  Map<String, dynamic> toMapGrouped() {
    return <String, dynamic>{'id': id, 'quantity': quantityGrouped};
  }

  factory AddToCart.fromMap(Map<String, dynamic> map) {
    return AddToCart(
      id: map['id'] != null ? map['id'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as String : null,
      item_data:
          map['item_data'] != null
              ? List<ItemCart>.from(
                (map['item_data'] as List<int>).map<ItemCart?>(
                  (x) => ItemCart.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      return_items:
          map['return_items'] != null ? map['return_items'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddToCart.fromJson(String source) =>
      AddToCart.fromMap(json.decode(source) as Map<String, dynamic>);
}
