import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuantityCard {
  int? value;
  int? minPurchase;
  int? maxPurchase;
  QuantityCard({this.value, this.minPurchase, this.maxPurchase});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'min_purchase': minPurchase,
      'max_purchase': maxPurchase,
    };
  }

  factory QuantityCard.fromMap(Map<String, dynamic> map) {
    return QuantityCard(
      value: map['value'] != null ? map['value'] as int : null,
      minPurchase:
          map['min_purchase'] != null ? map['min_purchase'] as int : null,
      maxPurchase:
          map['max_purchase'] != null ? map['max_purchase'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuantityCard.fromJson(String source) =>
      QuantityCard.fromMap(json.decode(source) as Map<String, dynamic>);
}

class TotalsCard {
  double? subtotal;
  double? subtotal_tax;
  double? total;
  double? tax;
  String? fee_total;
  String? fee_tax;
  String? discount_total;
  String? discount_tax;
  String? shipping_total;
  String? shipping_tax;
  String? total_tax;
  TotalsCard({
    this.subtotal,
    this.subtotal_tax,
    this.total,
    this.tax,
    this.fee_total,
    this.fee_tax,
    this.discount_total,
    this.discount_tax,
    this.shipping_total,
    this.shipping_tax,
    this.total_tax,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subtotal': subtotal,
      'subtotal_tax': subtotal_tax,
      'total': total,
      'tax': tax,
      'fee_total': fee_total,
      'fee_tax': fee_tax,
      'discount_total': discount_total,
      'discount_tax': discount_tax,
      'shipping_total': shipping_total,
      'shipping_tax': shipping_tax,
      'total_tax': total_tax,
    };
  }

  factory TotalsCard.fromMap(Map<String, dynamic> map) {
    return TotalsCard(
      subtotal:
          map['subtotal'] != null
              ? double.parse(map['subtotal'].toString())
              : null,
      subtotal_tax:
          map['subtotal_tax'] != null
              ? double.parse(map['subtotal_tax'].toString())
              : null,
      total:
          map['total'] != null ? double.parse(map['total'].toString()) : null,
      tax: map['tax'] != null ? double.parse(map['tax'].toString()) : null,
      fee_total: map['fee_total'] != null ? map['fee_total'] as String : null,
      fee_tax: map['fee_tax'] != null ? map['fee_tax'] as String : null,
      discount_total:
          map['discount_total'] != null
              ? map['discount_total'] as String
              : null,
      discount_tax:
          map['discount_tax'] != null ? map['discount_tax'] as String : null,
      shipping_total:
          map['shipping_total'] != null
              ? map['shipping_total'] as String
              : null,
      shipping_tax:
          map['shipping_tax'] != null ? map['shipping_tax'] as String : null,
      total_tax: map['total_tax'] != null ? map['total_tax'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalsCard.fromJson(String source) =>
      TotalsCard.fromMap(json.decode(source) as Map<String, dynamic>);
}
