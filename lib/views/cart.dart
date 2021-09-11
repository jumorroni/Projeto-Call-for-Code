import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:c4c/routes/app_route.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Cart extends StatefulWidget {
  late final Map foodData;
  Cart(this.foodData);
  @override
  _Cart createState() => _Cart(foodData);
}

class _Cart extends State<Cart> {
  late final Map _foodData;
  _Cart(this._foodData);

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart"),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
