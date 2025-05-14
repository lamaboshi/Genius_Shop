import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? display;
  int? menuOrder;
  CategoryImage? image;
  int? count;
  Category({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.display,
    this.menuOrder,
    this.image,
    this.count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'display': display,
      'count': count,
      'menu_order': menuOrder,
      'image': image!.toMap(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      count: map['count'] != null ? map['count'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      display: map['display'] != null ? map['display'] as String : null,
      menuOrder: map['menu_order'] != null ? map['menu_order'] as int : null,
      image:
          map['image'] != null
              ? CategoryImage.fromMap(map['image'] as Map<String, dynamic>)
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CategoryImage {
  int? id;
  String? src;
  CategoryImage({this.id, this.src});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'src': src};
  }

  factory CategoryImage.fromMap(Map<String, dynamic> map) {
    return CategoryImage(
      id: map['id'] != null ? map['id'] as int : null,
      src: map['src'] != null ? map['src'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryImage.fromJson(String source) =>
      CategoryImage.fromMap(json.decode(source) as Map<String, dynamic>);
}
