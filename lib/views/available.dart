import 'dart:convert';

import 'package:c4c/components/colors.dart';
import 'package:c4c/generated/l10n.dart';
import 'package:c4c/models/user.dart';
import 'package:c4c/views/map.page.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:c4c/views/foodpage.dart';
import 'package:provider/provider.dart';
import 'package:c4c/provider/foods.dart' as food;

class FoodsAvailable extends StatefulWidget {
  @override
  _FoodsAvailableState createState() => _FoodsAvailableState(this._user);
  late final User _user;
  FoodsAvailable(this._user);
}

class _FoodsAvailableState extends State<FoodsAvailable> {
  late final User _user;
  _FoodsAvailableState(this._user);
  @override
  void initState() {
    super.initState();
  }

//
  @override
  Widget build(BuildContext context) {
    final food.Foods _foodList = Provider.of(context);

    late int _dist = 0;
    late int dd;
    Future<double> calculaDist(l1, l2) async {
      return Geolocator.distanceBetween(l1[0], l1[1], l2[0], l2[1]);
    }

    Future<List> _findLocation(String val) async {
      final query = val;
      var addresses = await Geocoder.local.findAddressesFromQuery(query);
      var first = addresses.first;
      List l = [];
      l.add(first.coordinates.latitude);
      l.add(first.coordinates.longitude);
      return l;
    }

    Future<double> _calculaDistancia(String query1, String query2) async {
      List lista1 = await _findLocation(query1);
      List lista2 = await _findLocation(query2);
      double d = await calculaDist(lista1, lista2);
      d = d / 1000;
      return d;
    }

    late String query1, query2;
    Future<List<Dist>> _chamaFunc() async {
      late int i;
      double d;
      late List<Dist> l = [];
      query1 = _user.address.country +
          ' ' +
          _user.address.state +
          ' ' +
          _user.address.city +
          ' ' +
          _user.address.address;
      for (i = 0; i < _foodList.count; i++) {
        query2 = _foodList.byIndex(i).donor.address.country +
            ' ' +
            _foodList.byIndex(i).donor.address.state +
            ' ' +
            _foodList.byIndex(i).donor.address.city +
            ' ' +
            _foodList.byIndex(i).donor.address.address;

        d = await _calculaDistancia(query1, query2);
        dd = d.toInt();
        l.add(Dist(dist: dd));
      }
      return l;
    }

    Widget buildItem(BuildContext context, int index) {
      query1 = _user.address.country +
          ' ' +
          _user.address.state +
          ' ' +
          _user.address.city +
          ' ' +
          _user.address.address;

      query2 = _foodList.byIndex(index).donor.address.country +
          ' ' +
          _foodList.byIndex(index).donor.address.state +
          ' ' +
          _foodList.byIndex(index).donor.address.city +
          ' ' +
          _foodList.byIndex(index).donor.address.address;

      return Card(
        child: ListTile(
          subtitle: Text(_foodList.byIndex(index).type),
          title: Text(_foodList.byIndex(index).name),
          trailing: Text("$_dist km"),
          onTap: () {
            final _foodData = _foodList.byIndex(index);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodPage(_foodData, _user, index)));
          },
        ),
      );
    }

    listViewBuilder() {
      return FutureBuilder(
        builder: (context, snapshot) {
          if (ConnectionState.active != null && !snapshot.hasData) {
            return Center(child: Text(S.of(context).loading));
          }
          if (ConnectionState.done != null && snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10.0),

            itemCount: _foodList.count,
            itemBuilder: (context, index) {
              List l = snapshot.data as List;
              return Card(
                child: ListTile(
                  subtitle: Text(_foodList.byIndex(index).type),
                  title: Text(_foodList.byIndex(index).name),
                  trailing: Text("${l[index].dist} km"),
                  onTap: () {
                    final _foodData = _foodList.byIndex(index);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FoodPage(_foodData, _user, index)));
                  },
                ),
              );
            },
            //itemBuilder: buildItem,
          );
        },
        future: _chamaFunc(),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).available,
            style: TextStyle(color: MyColors.myRed),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.sort,
                color: MyColors.myRed,
              )),
              Tab(
                  icon: Icon(
                Icons.location_on,
                color: MyColors.myRed,
              )),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.grey,
          ),
          backgroundColor: MyColors.myWhite,
        ),
        body: TabBarView(
          children: [
            listViewBuilder(),
            MapPage(_user),
          ],
        ),
      ),
    );
  }
}

class Dist {
  int dist;
  Dist({required this.dist});
}
