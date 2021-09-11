import 'package:c4c/components/colors.dart';
import 'package:c4c/generated/l10n.dart';
import 'package:c4c/models/user.dart';
import 'package:flutter/material.dart';
import 'package:c4c/routes/app_route.dart';
import 'package:c4c/models/food.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:c4c/provider/requests.dart';
import 'package:c4c/models/request.dart';
import 'package:c4c/provider/foods.dart' as food;

//falta salvar os dados em requests

class MyRequest extends StatelessWidget {
  late final Food _foodData;
  late final int _qtd;
  late final User _user;
  MyRequest(this._foodData, this._qtd, this._user);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    final _dateParse = DateTime.parse(_foodData.date);
    String dateLimit =
        "${_dateParse.day.toString().padLeft(2, '0')}/${_dateParse.month.toString().padLeft(2, '0')}/${_dateParse.year.toString()}";
    String date =
        "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}";
    String time =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

    final food.Foods _foodList = Provider.of(context);

    final RequestsProvider _requestList = Provider.of(context);
    _requestList.put(
      Request(
        id: '',
        date: DateTime.now().toString(),
        requester: _user,
        food: _foodData,
        quantity: _qtd,
      ),
    );
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyColors.myWhite,
          title: Text(S.of(context).myRequest,
              style: TextStyle(color: MyColors.myRed)),
          leading: IconButton(
            color: MyColors.myRed,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                clipBehavior: Clip.antiAlias,
                color: Colors.white,
                elevation: 8.0,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).detail,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            S.of(context).date + ": ",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            S.of(context).time + ": ",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            time,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            S.of(context).quantity + ": ",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$_qtd kg",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  S.of(context).type,
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  _foodData.type,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  S.of(context).nameFood,
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  _foodData.name,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  S.of(context).finality,
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  _foodData.finality,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            S.of(context).deadline + ": ",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$dateLimit",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        S.of(context).pickup + ":",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        S.of(context).country +
                            ": ${_foodData.donor.address.country}",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        S.of(context).state +
                            ": ${_foodData.donor.address.state}",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        S.of(context).city +
                            ": ${_foodData.donor.address.city}",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        S.of(context).address +
                            ": ${_foodData.donor.address.address}",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            S.of(context).donorName + ": ",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _foodData.donor.name,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            S.of(context).donorContact + ": ",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _foodData.donor.phone,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        S.of(context).thankYou,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
