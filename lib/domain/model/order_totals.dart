import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderTotals {
  String? slug;
  String? name;
  int? total;
  OrderTotals({this.slug, this.name, this.total});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'slug': slug, 'name': name, 'total': total};
  }

  factory OrderTotals.fromMap(Map<String, dynamic> map) {
    return OrderTotals(
      slug: map['slug'] != null ? map['slug'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      total: map['total'] != null ? map['total'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderTotals.fromJson(String source) =>
      OrderTotals.fromMap(json.decode(source) as Map<String, dynamic>);
}
