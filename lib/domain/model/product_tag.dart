import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductTag {
  int id;
  String name;
  String slug;
  String description;
  ProductTag({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
    };
  }

  factory ProductTag.fromMap(Map<String, dynamic> map) {
    return ProductTag(
      id: map['id'] as int,
      name: map['name'] as String,
      slug: map['slug'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductTag.fromJson(String source) =>
      ProductTag.fromMap(json.decode(source) as Map<String, dynamic>);
}
