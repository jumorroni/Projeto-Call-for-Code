import 'package:c4c/components/colors.dart';
import 'package:c4c/generated/l10n.dart';
import 'package:c4c/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:c4c/provider/foods.dart' as food;
import 'package:c4c/provider/requests.dart' as req;

class MyStatistics extends StatefulWidget {
  MyStatistics(this.user);
  late final User user;
  @override
  _MyStatistics createState() => _MyStatistics(this.user);
}

class _MyStatistics extends State<MyStatistics> {
  late final User _user;
  _MyStatistics(this._user);
  int _waste = 0;
  int _economy = 0;
  double _wc = 0;
  double _ec = 0;
  @override
  Widget build(BuildContext context) {
    final food.Foods _foodList = Provider.of(context); //donations list
    late final req.RequestsProvider _myRequests =
        Provider.of(context, listen: false); //economy list;

    for (int i = 0; i < _foodList.count; i++) {
      if (_foodList.byIndex(i).donor.email == _user.email) {
        setState(() {
          _waste += _foodList.byIndex(i).quantity;
        });
      }
    }
    for (int i = 0; i < _myRequests.count; i++) {
      if (_myRequests.byIndex(i).requester.email == _user.email) {
        setState(() {
          _economy += _myRequests.byIndex(i).quantity;
        });
      }
    }

    setState(() {
      _wc = 2.53 * _waste;
      _ec = 2.53 * _economy;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myRed,
        iconTheme: IconThemeData(color: MyColors.myWhite),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              S.of(context).progress,
              style: TextStyle(
                color: MyColors.myRed,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: MyColors.myWhite,
                  elevation: 8.0,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          S.of(context).waste,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(S.of(context).food + ': $_waste kg'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('CO2: ${_wc.toStringAsFixed(2)} kg'),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
              ),
              Container(
                width: 150,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: MyColors.myWhite,
                  elevation: 8.0,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          S.of(context).economy,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(S.of(context).food + ': $_economy kg'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('CO2: ${_ec.toStringAsFixed(2)} kg'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
