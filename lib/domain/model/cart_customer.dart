import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartCustomer {
  BillingAddress? billing_address;
  ShippingAddress? shipping_address;
  CartCustomer({this.billing_address, this.shipping_address});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'billing_address': billing_address?.toMap(),
      'shipping_address': shipping_address?.toMap(),
    };
  }

  factory CartCustomer.fromMap(Map<String, dynamic> map) {
    return CartCustomer(
      billing_address:
          map['billing_address'] != null
              ? BillingAddress.fromMap(
                map['billing_address'] as Map<String, dynamic>,
              )
              : null,
      shipping_address:
          map['shipping_address'] != null
              ? ShippingAddress.fromMap(
                map['shipping_address'] as Map<String, dynamic>,
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartCustomer.fromJson(String source) =>
      CartCustomer.fromMap(json.decode(source) as Map<String, dynamic>);
}

class BillingAddress {
  String? billing_first_name;
  String? billing_last_name;
  String? billing_company;
  String? billing_country;
  String? billing_address_1;
  String? billing_address_2;
  String? billing_city;
  String? billing_state;
  String? billing_postcode;
  String? billing_phone;
  String? billing_email;
  BillingAddress({
    this.billing_first_name,
    this.billing_last_name,
    this.billing_company,
    this.billing_country,
    this.billing_address_1,
    this.billing_address_2,
    this.billing_city,
    this.billing_state,
    this.billing_postcode,
    this.billing_phone,
    this.billing_email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'billing_first_name': billing_first_name,
      'billing_last_name': billing_last_name,
      'billing_company': billing_company,
      'billing_country': billing_country,
      'billing_address_1': billing_address_1,
      'billing_address_2': billing_address_2,
      'billing_city': billing_city,
      'billing_state': billing_state,
      'billing_postcode': billing_postcode,
      'billing_phone': billing_phone,
      'billing_email': billing_email,
    };
  }

  factory BillingAddress.fromMap(Map<String, dynamic> map) {
    return BillingAddress(
      billing_first_name:
          map['billing_first_name'] != null
              ? map['billing_first_name'] as String
              : null,
      billing_last_name:
          map['billing_last_name'] != null
              ? map['billing_last_name'] as String
              : null,
      billing_company:
          map['billing_company'] != null
              ? map['billing_company'] as String
              : null,
      billing_country:
          map['billing_country'] != null
              ? map['billing_country'] as String
              : null,
      billing_address_1:
          map['billing_address_1'] != null
              ? map['billing_address_1'] as String
              : null,
      billing_address_2:
          map['billing_address_2'] != null
              ? map['billing_address_2'] as String
              : null,
      billing_city:
          map['billing_city'] != null ? map['billing_city'] as String : null,
      billing_state:
          map['billing_state'] != null ? map['billing_state'] as String : null,
      billing_postcode:
          map['billing_postcode'] != null
              ? map['billing_postcode'] as String
              : null,
      billing_phone:
          map['billing_phone'] != null ? map['billing_phone'] as String : null,
      billing_email:
          map['billing_email'] != null ? map['billing_email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BillingAddress.fromJson(String source) =>
      BillingAddress.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ShippingAddress {
  String? shipping_first_name;
  String? shipping_last_name;
  String? shipping_company;
  String? shipping_country;
  String? shipping_address_1;
  String? shipping_address_2;
  String? shipping_city;
  String? shipping_state;
  String? shipping_postcode;
  ShippingAddress({
    this.shipping_first_name,
    this.shipping_last_name,
    this.shipping_company,
    this.shipping_country,
    this.shipping_address_1,
    this.shipping_address_2,
    this.shipping_city,
    this.shipping_state,
    this.shipping_postcode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shipping_first_name': shipping_first_name,
      'shipping_last_name': shipping_last_name,
      'shipping_company': shipping_company,
      'shipping_country': shipping_country,
      'shipping_address_1': shipping_address_1,
      'shipping_address_2': shipping_address_2,
      'shipping_city': shipping_city,
      'shipping_state': shipping_state,
      'shipping_postcode': shipping_postcode,
    };
  }

  factory ShippingAddress.fromMap(Map<String, dynamic> map) {
    return ShippingAddress(
      shipping_first_name:
          map['shipping_first_name'] != null
              ? map['shipping_first_name'] as String
              : null,
      shipping_last_name:
          map['shipping_last_name'] != null
              ? map['shipping_last_name'] as String
              : null,
      shipping_company:
          map['shipping_company'] != null
              ? map['shipping_company'] as String
              : null,
      shipping_country:
          map['shipping_country'] != null
              ? map['shipping_country'] as String
              : null,
      shipping_address_1:
          map['shipping_address_1'] != null
              ? map['shipping_address_1'] as String
              : null,
      shipping_address_2:
          map['shipping_address_2'] != null
              ? map['shipping_address_2'] as String
              : null,
      shipping_city:
          map['shipping_city'] != null ? map['shipping_city'] as String : null,
      shipping_state:
          map['shipping_state'] != null
              ? map['shipping_state'] as String
              : null,
      shipping_postcode:
          map['shipping_postcode'] != null
              ? map['shipping_postcode'] as String
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShippingAddress.fromJson(String source) =>
      ShippingAddress.fromMap(json.decode(source) as Map<String, dynamic>);
}
