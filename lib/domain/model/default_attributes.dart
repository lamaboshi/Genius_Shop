import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DefaultAttribute {
  int? id;
  String? option;
  String? name;
  DefaultAttribute({this.id, this.option, this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'option': option, 'name': name};
  }

  factory DefaultAttribute.fromMap(Map<String, dynamic> map) {
    return DefaultAttribute(
      id: map['id'] != null ? map['id'] as int : null,
      option: map['option'] != null ? map['option'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DefaultAttribute.fromJson(String source) =>
      DefaultAttribute.fromMap(json.decode(source) as Map<String, dynamic>);
}
