import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dimensions {
  String? length;
  String? width;
  String? height;
  Dimensions({this.length, this.width, this.height});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'length': length,
      'width': width,
      'height': height,
    };
  }

  factory Dimensions.fromMap(Map<String, dynamic> map) {
    return Dimensions(
      length: map['length'] != null ? map['length'] as String : null,
      width: map['width'] != null ? map['width'] as String : null,
      height: map['height'] != null ? map['height'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dimensions.fromJson(String source) =>
      Dimensions.fromMap(json.decode(source) as Map<String, dynamic>);
}
