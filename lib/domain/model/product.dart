// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'default_attributes.dart';
import 'product_attribute.dart';
import 'product_category.dart';
import 'product_image.dart';
import 'product_tag.dart';

class Product {
  int? id;
  String? name;
  String? type;
  String? slug;
  String? description;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? shortDescription;
  List<Category>? categories;
  List<ProductImage>? images;
  List<Attribute>? attributes;
  List<DefaultAttribute>? defaultAttributes;
  List<ProductTag>? tags;
  Product({
    this.id,
    this.name,
    this.type,
    this.slug,
    this.description,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.shortDescription,
    this.categories,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? 0,
      'name': name,
      'type': type,
      'slug': slug,
      'description': description,
      'price': price,
      'regularPrice': regularPrice,
      'salePrice': salePrice,
      'shortDescription': shortDescription,
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
      type: map['type'] != null ? map['type'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      description: map['description']?.toString().replaceAll(
        RegExp(r'<\/?[^>]+>'),
        '',
      ),
      price: map['price'] != null ? map['price'] as String : null,
      regularPrice:
          map['regular_price'] != null ? map['regular_price'] as String : null,
      salePrice: map['sale_price'] != null ? map['sale_price'] as String : null,
      shortDescription: map['short_description']?.toString().replaceAll(
        RegExp(r'<\/?[^>]+>'),
        '',
      ),
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
