import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? name;
  String? slug;
  String? nickname;
  String? password;
  String? email;
  String? description;
  List<String>? role;
  bool? isSuperAdmin;
  String? avatarUrl;
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.nickname,
    this.slug,
    this.role,
    this.name,
    this.userName,
    this.password,
    this.email,
    this.isSuperAdmin,
    this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? 0,
      'first_name': firstName,
      'last_name': lastName,
      'slug': userName,
      'username': userName,
      'nickname': nickname,
      'name': name,
      'email': email,
      'password': password,
      'avatar_url': avatarUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      name: map['name'],
      userName: map['username'],
      nickname: map['nickname'],
      slug: map['slug'],
      role:
          map['roles'] != null
              ? List<String>.from((map['roles'] as List))
              : null,
      avatarUrl: map['avatar_urls']['48'],

      email: map['email'],
      isSuperAdmin: map['is_super_admin'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, userName: $userName, email: $email, isSuperAdmin: $isSuperAdmin)';
  }
}
