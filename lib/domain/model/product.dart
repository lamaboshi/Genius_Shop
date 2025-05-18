// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genius_shop/domain/model/product_download.dart';

import 'default_attributes.dart';
import 'dimensions.dart';
import 'product_attribute.dart';
import 'product_category.dart';
import 'product_image.dart';
import 'product_tag.dart';

enum ProductType {
  variable(Color(0xFF9C27B0)), // Purple
  simple(Color(0xFF4CAF50)), // Green
  grouped(Color(0xFFFF9800)), // Orange
  external(Color(0xFF2196F3)); // Blue

  const ProductType(this.color);
  final Color color;
}

enum StockStatus {
  instock(Color(0xFFF44336)),
  outofstock(Color(0xFF4CAF50)),
  onbackorder(Color(0xFFFFC107));

  const StockStatus(this.color);
  final Color color;
}

class Product {
  int? id;
  String? name;
  ProductType? type;
  String? sku;
  String? slug;
  String? description;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? shortDescription;
  bool? onSale;
  bool? purchasable;
  bool? virtual;
  bool? downloadable;
  bool? manageStock;
  int? stockQuantity;
  String? averageRating;
  List<int>? relatedIds;
  List<int>? upsellIds;
  int? ratingCount;
  StockStatus? stockStatus;
  bool? backordersAllowed;
  bool? backOrdered;
  bool? soldIndividually;
  bool? shippingRequired;
  int? shippingClassId;
  Dimensions? dimensions;
  String? weight;
  List<ProductDownload>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  List<Category>? categories;
  List<ProductImage>? images;
  List<Attribute>? attributes;
  List<DefaultAttribute>? defaultAttributes;
  List<ProductTag>? tags;
  Product({
    this.id,
    this.name,
    this.sku,
    this.slug,
    this.description,
    this.type,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.shortDescription,
    this.onSale,
    this.purchasable,
    this.virtual,
    this.downloadable,
    this.manageStock,
    this.weight,
    this.stockQuantity,
    this.averageRating,
    this.shippingClassId,
    this.relatedIds,
    this.upsellIds,
    this.ratingCount,
    this.stockStatus,
    this.backordersAllowed,
    this.backOrdered,
    this.soldIndividually,
    this.shippingRequired,
    this.dimensions,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.categories,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sku': sku,
      'slug': slug,
      'description': description,
      'price': price,
      'regularPrice': regularPrice,
      'salePrice': salePrice,
      'shortDescription': shortDescription,
      'onSale': onSale,
      'purchasable': purchasable,
      'virtual': virtual,
      'downloadable': downloadable,
      'manageStock': manageStock,
      'stockQuantity': stockQuantity,
      'averageRating': averageRating,
      'relatedIds': relatedIds,
      'upsellIds': upsellIds,
      'ratingCount': ratingCount,
      'backordersAllowed': backordersAllowed,
      'backOrdered': backOrdered,
      'soldIndividually': soldIndividually,
      'shippingRequired': shippingRequired,
      'downloads': downloads?.map((x) => x.toMap()).toList(),
      'downloadLimit': downloadLimit,
      'downloadExpiry': downloadExpiry,
      'categories': categories?.map((x) => x.toMap()).toList(),
      'images': images?.map((x) => x.toMap()).toList(),
      'attributes': attributes?.map((x) => x.toMap()).toList(),
      'defaultAttributes': defaultAttributes?.map((x) => x.toMap()).toList(),
      'tags': tags?.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      weight: map['weight'] != null ? map['weight'] as String : null,
      description: map['description']?.toString().replaceAll(
        RegExp(r'<\/?[^>]+>'),
        '',
      ),
      price: map['price'] != null ? map['price'] as String : null,
      regularPrice:
          map['regular_price'] != null ? map['regular_price'] as String : null,
      salePrice: map['sale_price'] != null ? map['sale_price'] as String : null,
      shippingClassId:
          map['shipping_class_id'] != null
              ? map['shipping_class_id'] as int
              : null,
      shortDescription: map['short_description']?.toString().replaceAll(
        RegExp(r'<\/?[^>]+>'),
        '',
      ),
      onSale: map['on_sale'] != null ? map['on_sale'] as bool : null,
      purchasable:
          map['purchasable'] != null ? map['purchasable'] as bool : null,
      virtual: map['virtual'] != null ? map['virtual'] as bool : null,
      downloadable:
          map['downloadable'] != null ? map['downloadable'] as bool : null,

      manageStock:
          map['manage_stock'] != null ? map['manage_stock'] as bool : null,
      stockQuantity:
          map['stock_quantity'] != null ? map['stock_quantity'] as int : null,
      averageRating:
          map['average_rating'] != null
              ? map['average_rating'] as String
              : null,
      relatedIds:
          map['related_ids'] != null
              ? List<int>.from((map['related_ids'] as List))
              : null,
      upsellIds:
          map['upsell_ids'] != null
              ? List<int>.from((map['upsell_ids'] as List))
              : null,
      ratingCount:
          map['rating_count'] != null ? map['rating_count'] as int : null,
      stockStatus:
          map['stock_status'] != null
              ? StockStatus.values
                  .where((t) => t.name == map['stock_status'])
                  .first
              : null,
      type:
          map['type'] != null
              ? ProductType.values.where((t) => t.name == map['type']).first
              : null,
      backordersAllowed:
          map['backorders_allowed'] != null
              ? map['backorders_allowed'] as bool
              : null,
      backOrdered:
          map['backordered'] != null ? map['backordered'] as bool : null,
      soldIndividually:
          map['sold_individually'] != null
              ? map['sold_individually'] as bool
              : null,
      shippingRequired:
          map['shipping_required'] != null
              ? map['shipping_required'] as bool
              : null,

      dimensions:
          map['dimensions'] != null
              ? Dimensions.fromMap(map['dimensions'] as Map<String, dynamic>)
              : null,
      downloads:
          map['downloads'] != null
              ? List<ProductDownload>.from(
                (map['downloads'] as List).map<ProductDownload?>(
                  (x) => ProductDownload.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      downloadLimit:
          map['download_limit'] != null ? map['download_limit'] as int : null,
      downloadExpiry:
          map['download_expiry'] != null ? map['download_expiry'] as int : null,
      categories:
          map['categories'] != null
              ? List<Category>.from(
                (map['categories'] as List).map<Category?>(
                  (x) => Category.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      images:
          map['images'] != null
              ? List<ProductImage>.from(
                (map['images'] as List).map<ProductImage?>(
                  (x) => ProductImage.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      attributes:
          map['attributes'] != null
              ? List<Attribute>.from(
                (map['attributes'] as List).map<Attribute?>(
                  (x) => Attribute.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      defaultAttributes:
          map['default_attributes'] != null
              ? List<DefaultAttribute>.from(
                (map['default_attributes'] as List).map<DefaultAttribute?>(
                  (x) => DefaultAttribute.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      tags:
          map['tags'] != null
              ? List<ProductTag>.from(
                (map['tags'] as List).map<ProductTag?>(
                  (x) => ProductTag.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
