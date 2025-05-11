import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String role;
  final bool isPayingCustomer;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.userName,
    required this.email,
    required this.isPayingCustomer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'username': userName,
      'role': role,
      'email': email,
      'isPayingCustomer': isPayingCustomer,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      userName: map['username'] as String,
      role: map['role'] as String,
      email: map['email'] as String,
      isPayingCustomer: map['is_paying_customer'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, userName: $userName, email: $email, isPayingCustomer: $isPayingCustomer)';
  }
}
