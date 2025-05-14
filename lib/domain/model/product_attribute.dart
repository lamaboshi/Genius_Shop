import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Attribute {
  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;
  Attribute({
    this.id,
    this.position,
    this.visible,
    this.variation,
    this.options,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? 0,
      'position': position ?? 0,
      'name': name ?? '',
      'visible': visible,
      'variation': variation,
      'options': options,
    };
  }

  factory Attribute.fromMap(Map<String, dynamic> map) {
    return Attribute(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      position: map['position'] != null ? map['position'] as int : null,
      visible: map['visible'] != null ? map['visible'] as bool : null,
      variation: map['variation'] != null ? map['variation'] as bool : null,
      options:
          map['options'] != null
              ? List<String>.from((map['options'] as List))
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Attribute.fromJson(String source) =>
      Attribute.fromMap(json.decode(source) as Map<String, dynamic>);
}
