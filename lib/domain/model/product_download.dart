import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDownload {
  String? id;
  String? name;
  String? file;
  ProductDownload({this.id, this.name, this.file});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'file': file};
  }

  factory ProductDownload.fromMap(Map<String, dynamic> map) {
    return ProductDownload(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      file: map['file'] != null ? map['file'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDownload.fromJson(String source) =>
      ProductDownload.fromMap(json.decode(source) as Map<String, dynamic>);
}
