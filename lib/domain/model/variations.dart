import 'package:genius_shop/domain/model/dimensions.dart';
import 'package:genius_shop/domain/model/product_attribute.dart';
import 'package:genius_shop/domain/model/product_image.dart';

class VariationProduct {
  int? id;
  String? type;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? description;
  String? permalink;
  String? sku;
  String? globalUniqueId;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool? onSale;
  String? status;
  bool? purchasable;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  String? stockStatus;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  dynamic lowStockAmount;
  String? weight;
  Dimensions? dimensions;
  String? shippingClass;
  int? shippingClassId;
  ProductImage? image;
  List<Attribute>? attributes;
  String? name;
  int? parentId;

  VariationProduct({
    this.id,
    this.type,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.description,
    this.permalink,
    this.sku,
    this.globalUniqueId,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.onSale,
    this.status,
    this.purchasable,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.stockStatus,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.weight,
    this.dimensions,
    this.shippingClass,
    this.shippingClassId,
    this.image,
    this.attributes,
    this.name,
    this.parentId,
  });

  factory VariationProduct.fromMap(Map<String, dynamic> json) {
    return VariationProduct(
      id: json['id'],
      type: json['type'],
      dateCreated: json['date_created'],
      dateCreatedGmt: json['date_created_gmt'],
      dateModified: json['date_modified'],
      dateModifiedGmt: json['date_modified_gmt'],
      description: json['description'],
      permalink: json['permalink'],
      sku: json['sku'],
      globalUniqueId: json['global_unique_id'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      dateOnSaleFrom: json['date_on_sale_from'],
      dateOnSaleFromGmt: json['date_on_sale_from_gmt'],
      dateOnSaleTo: json['date_on_sale_to'],
      dateOnSaleToGmt: json['date_on_sale_to_gmt'],
      onSale: json['on_sale'],
      status: json['status'],
      purchasable: json['purchasable'],
      virtual: json['virtual'],
      downloadable: json['downloadable'],
      downloads:
          json['downloads'] != null
              ? List<dynamic>.from(json['downloads'])
              : null,
      downloadLimit: json['download_limit'],
      downloadExpiry: json['download_expiry'],
      taxStatus: json['tax_status'],
      taxClass: json['tax_class'],
      manageStock: json['manage_stock'],
      stockQuantity: json['stock_quantity'],
      stockStatus: json['stock_status'],
      backorders: json['backorders'],
      backordersAllowed: json['backorders_allowed'],
      backordered: json['backordered'],
      lowStockAmount: json['low_stock_amount'],
      weight: json['weight'],
      dimensions:
          json['dimensions'] != null
              ? Dimensions.fromMap(json['dimensions'])
              : null,
      shippingClass: json['shipping_class'],
      shippingClassId: json['shipping_class_id'],
      image: json['image'] != null ? ProductImage.fromMap(json['image']) : null,
      attributes:
          json['attributes'] != null
              ? (json['attributes'] as List)
                  .map((i) => Attribute.fromMap(i))
                  .toList()
              : null,
      name: json['name'],
      parentId: json['parent_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'date_created': dateCreated,
      'date_created_gmt': dateCreatedGmt,
      'date_modified': dateModified,
      'date_modified_gmt': dateModifiedGmt,
      'description': description,
      'permalink': permalink,
      'sku': sku,
      'global_unique_id': globalUniqueId,
      'price': price,
      'regular_price': regularPrice,
      'sale_price': salePrice,
      'date_on_sale_from': dateOnSaleFrom,
      'date_on_sale_from_gmt': dateOnSaleFromGmt,
      'date_on_sale_to': dateOnSaleTo,
      'date_on_sale_to_gmt': dateOnSaleToGmt,
      'on_sale': onSale,
      'status': status,
      'purchasable': purchasable,
      'virtual': virtual,
      'downloadable': downloadable,
      'downloads': downloads,
      'download_limit': downloadLimit,
      'download_expiry': downloadExpiry,
      'tax_status': taxStatus,
      'tax_class': taxClass,
      'manage_stock': manageStock,
      'stock_quantity': stockQuantity,
      'stock_status': stockStatus,
      'backorders': backorders,
      'backorders_allowed': backordersAllowed,
      'backordered': backordered,
      'low_stock_amount': lowStockAmount,
      'weight': weight,
      'dimensions': dimensions?.toJson(),
      'shipping_class': shippingClass,
      'shipping_class_id': shippingClassId,
      'image': image?.toJson(),
      'attributes': attributes?.map((e) => e.toJson()).toList(),
      'name': name,
      'parent_id': parentId,
    };
  }
}
