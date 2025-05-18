import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Report {
  String? slug;
  String? description;
  String? href;
  Report({this.slug, this.description, this.href});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slug': slug,
      'description': description,
      'href': href,
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    final selfLinks = map['_links']['self'] as List;
    final selfHref =
        selfLinks.isNotEmpty ? selfLinks.first['href'] as String : '';
    return Report(
      slug: map['slug'] != null ? map['slug'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      href: selfHref,
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) =>
      Report.fromMap(json.decode(source) as Map<String, dynamic>);
}
