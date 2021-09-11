import 'package:c4c/models/user.dart';

class Food {
  final String id;
  final String type;
  final String name;
  final String finality;
  final User donor;
  final int quantity;
  final String date;

  const Food({
    required this.id,
    required this.type,
    required this.name,
    required this.finality,
    required this.donor,
    required this.quantity,
    required this.date,
  });
}
