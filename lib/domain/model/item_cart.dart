// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:genius_shop/domain/model/dimensions.dart';
import 'package:genius_shop/domain/model/quantity_card.dart';

class ItemCart {
  String? item_key;
  int? id;
  String? name;
  String? title;
  String? price;
  QuantityCard? quantity;
  TotalsCard? totals;
  String? slug;
  Meta? meta;
  String? featured_image;
  List<int>? variations;
  ItemCart({
    this.item_key,
    this.id,
    this.name,
    this.title,
    this.price,
    this.quantity,
    this.totals,
    this.slug,
    this.meta,
    this.featured_image,
    this.variations,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'item_key': item_key,
      'id': id,
      'name': name,
      'title': title,
      'price': price,
      'quantity': quantity?.toMap(),
      'totals': totals?.toMap(),
      'slug': slug,
      'meta': meta?.toMap(),
      'featured_image': featured_image,
      'variations': variations,
    };
  }

  factory ItemCart.fromMap(Map<String, dynamic> map) {
    return ItemCart(
      item_key: map['item_key'] != null ? map['item_key'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      quantity:
          map['quantity'] != null
              ? QuantityCard.fromMap(map['quantity'] as Map<String, dynamic>)
              : null,
      totals:
          map['totals'] != null
              ? TotalsCard.fromMap(map['totals'] as Map<String, dynamic>)
              : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      meta:
          map['meta'] != null
              ? Meta.fromMap(map['meta'] as Map<String, dynamic>)
              : null,
      featured_image:
          map['featured_image'] != null
              ? map['featured_image'] as String
              : null,
      variations:
          map['variations'] != null
              ? List<int>.from((map['variations'] as List<int>))
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCart.fromJson(String source) =>
      ItemCart.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Meta {
  String? product_type;
  String? sku;
  Dimensions? dimensions;
  String? weight;
  Meta({this.product_type, this.sku, this.dimensions, this.weight});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_type': product_type,
      'sku': sku,
      'dimensions': dimensions?.toMap(),
      'weight': weight,
    };
  }

  factory Meta.fromMap(Map<String, dynamic> map) {
    return Meta(
      product_type:
          map['product_type'] != null ? map['product_type'] as String : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      dimensions:
          map['dimensions'] != null
              ? Dimensions.fromMap(map['dimensions'] as Map<String, dynamic>)
              : null,
      weight: map['weight'] != null ? map['weight'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meta.fromJson(String source) =>
      Meta.fromMap(json.decode(source) as Map<String, dynamic>);
}
