import 'dart:convert';

import 'package:genius_shop/domain/model/cart_customer.dart';
import 'package:genius_shop/domain/model/item_cart.dart';
import 'package:genius_shop/domain/model/quantity_card.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cart {
  String? cartHash;
  String? cartKey;
  Currency? currency;
  CartCustomer? customer;
  List<ItemCart>? items;
  int? item_count;
  String? items_weight;
  bool? needs_payment;
  bool? needs_shipping;
  TotalsCard? totals;
  Cart({
    this.cartHash,
    this.cartKey,
    this.currency,
    this.items,
    this.item_count,
    this.items_weight,
    this.needs_payment,
    this.needs_shipping,
    this.totals,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cartHash': cartHash,
      'cartKey': cartKey,
      'currency': currency?.toMap(),
      'items': items?.map((x) => x.toMap()).toList(),
      'item_count': item_count,
      'items_weight': items_weight,
      'needs_payment': needs_payment,
      'needs_shipping': needs_shipping,
      'totals': totals?.toMap(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      cartHash: map['cartHash'] != null ? map['cartHash'] as String : null,
      cartKey: map['cartKey'] != null ? map['cartKey'] as String : null,
      currency:
          map['currency'] != null
              ? Currency.fromMap(map['currency'] as Map<String, dynamic>)
              : null,
      items:
          map['items'] != null
              ? List<ItemCart>.from(
                (map['items'] as List).map<ItemCart?>(
                  (x) => ItemCart.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      item_count: map['item_count'] != null ? map['item_count'] as int : null,
      items_weight:
          map['items_weight'] != null ? map['items_weight'] as String : null,
      needs_payment:
          map['needs_payment'] != null ? map['needs_payment'] as bool : null,
      needs_shipping:
          map['needs_shipping'] != null ? map['needs_shipping'] as bool : null,
      totals:
          map['totals'] != null
              ? TotalsCard.fromMap(map['totals'] as Map<String, dynamic>)
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Currency {
  String? currency_code;
  String? currency_symbol;
  String? currency_symbol_pos;
  String? currency_minor_unit;
  String? currency_decimal_separator;
  String? currency_thousand_separator;
  String? currency_prefix;
  String? currency_suffix;
  Currency({
    this.currency_code,
    this.currency_symbol,
    this.currency_symbol_pos,
    this.currency_minor_unit,
    this.currency_decimal_separator,
    this.currency_thousand_separator,
    this.currency_prefix,
    this.currency_suffix,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currency_code': currency_code,
      'currency_symbol': currency_symbol,
      'currency_symbol_pos': currency_symbol_pos,
      'currency_minor_unit': currency_minor_unit,
      'currency_decimal_separator': currency_decimal_separator,
      'currency_thousand_separator': currency_thousand_separator,
      'currency_prefix': currency_prefix,
      'currency_suffix': currency_suffix,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      currency_code:
          map['currency_code'] != null ? map['currency_code'] as String : null,
      currency_symbol:
          map['currency_symbol'] != null
              ? map['currency_symbol'] as String
              : null,
      currency_symbol_pos:
          map['currency_symbol_pos'] != null
              ? map['currency_symbol_pos'] as String
              : null,
      currency_minor_unit: map['currency_minor_unit']?.toString(),
      currency_decimal_separator:
          map['currency_decimal_separator'] != null
              ? map['currency_decimal_separator'] as String
              : null,
      currency_thousand_separator:
          map['currency_thousand_separator'] != null
              ? map['currency_thousand_separator'] as String
              : null,
      currency_prefix:
          map['currency_prefix'] != null
              ? map['currency_prefix'] as String
              : null,
      currency_suffix:
          map['currency_suffix'] != null
              ? map['currency_suffix'] as String
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Currency.fromJson(String source) =>
      Currency.fromMap(json.decode(source) as Map<String, dynamic>);
}
