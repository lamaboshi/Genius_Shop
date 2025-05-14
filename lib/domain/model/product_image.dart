import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductImage {
  int? id;
  String? src;
  String? name;
  ProductImage({this.id, this.src, this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'src': src, 'name': name};
  }

  factory ProductImage.fromMap(Map<String, dynamic> map) {
    return ProductImage(
      id: map['id'] != null ? map['id'] as int : null,
      src: map['src'] != null ? map['src'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductImage.fromJson(String source) =>
      ProductImage.fromMap(json.decode(source) as Map<String, dynamic>);
}
