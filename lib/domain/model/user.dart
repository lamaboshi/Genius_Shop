import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int? id;
  String? firstName;
  final String? lastName;
  String? userName;
  String? name;
  String? password;
  String? email;
  String? description;
  String? role;
  bool? isSuperAdmin;
  String? avatarUrl;
  User({
    this.id,
    this.firstName,
    this.lastName,
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
      userName: map['slug'],
      role: map['role'],
      avatarUrl: map['avatar_url'],
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
