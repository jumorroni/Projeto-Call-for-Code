import 'dart:math';

import 'package:flutter/material.dart';
import 'package:c4c/data/dummy_foods.dart';
import 'package:c4c/models/food.dart';

class Foods with ChangeNotifier {
  final Map<String, Food> _items = {...DUMMY_FOODS};

  List<Food> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Food byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Food food) {
    if (food == null) {
      return;
    }
    //Só adiciono se o usuário não existir
    if (food.id != null &&
        food.id.trim().isNotEmpty &&
        _items.containsKey(food.id)) {
      _items.update(
        food.id,
        (_) => Food(
          id: food.id,
          date: food.date,
          type: food.type,
          name: food.name,
          quantity: food.quantity,
          finality: food.finality,
          donor: food.donor,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Food(
          id: id,
          date: food.date,
          type: food.type,
          name: food.name,
          quantity: food.quantity,
          finality: food.finality,
          donor: food.donor,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Food food) {
    if (food != null && food.id != null) {
      _items.remove(food.id);
    }
  }
}
