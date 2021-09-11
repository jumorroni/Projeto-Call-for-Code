import 'package:c4c/models/user.dart';
import 'package:c4c/models/food.dart';

class Request {
  final String id;
  final String date;
  final User requester;
  final Food food;
  final int quantity;

  const Request({
    required this.id,
    required this.date,
    required this.requester,
    required this.food,
    required this.quantity,
  });
}
