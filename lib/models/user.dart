import 'package:c4c/models/address.dart';

class User {
  final String id;
  final String name;
  final String phone;
  final String email;
  final Address address;
  final String password;

  const User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.password,
  });
}
