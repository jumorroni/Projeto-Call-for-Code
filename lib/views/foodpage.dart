import 'package:c4c/components/colors.dart';
import 'package:c4c/generated/l10n.dart';
import 'package:c4c/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:c4c/views/request.dart';
import 'package:c4c/models/food.dart';
import 'package:provider/provider.dart';
import 'package:c4c/provider/foods.dart';

class FoodPage extends StatefulWidget {
  late final Food foodData;
  late final int foodDataIndex;
  late final User _user;
  FoodPage(this.foodData, this._user, this.foodDataIndex);

  @override
  _FoodPage createState() =>
      _FoodPage(this.foodData, this._user, this.foodDataIndex);
}

class _FoodPage extends State<FoodPage> {
  late final Food _foodData;
  late final User _user;
  late final int _foodDataIndex;
  _FoodPage(this._foodData, this._user, this._foodDataIndex);

  @override
  int _qtd = 1;

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var avatar = ExactAssetImage("images/potato.jpeg");

    final Foods _foodList = Provider.of(context);

    final _dateParse = DateTime.parse(_foodData.date);
    String date =
        "${_dateParse.day.toString().padLeft(2, '0')}/${_dateParse.month.toString().padLeft(2, '0')}/${_dateParse.year.toString()}";

    return Scaffold(
      appBar: AppBar(
        title:
            Text(S.of(context).detail, style: TextStyle(color: MyColors.myRed)),
        backgroundColor: MyColors.myWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: MyColors.myRed,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Material(
                        elevation: 8.0,
                        child: Image(
                          image: avatar,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              clipBehavior: Clip.antiAlias,
              color: MyColors.myWhite,
              elevation: 8.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
                child: Column(
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
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
                                    color: Colors.grey[800],
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                _foodData.type,
                                style: TextStyle(
                                    color: Colors.grey[800],
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
                                    color: Colors.grey[800],
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                _foodData.name,
                                style: TextStyle(
                                    color: Colors.grey[800],
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
                                    color: Colors.grey[800],
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                _foodList.all
                                    .elementAt(_foodDataIndex)
                                    .finality,
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              child: Text(
                                "$_qtd",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 57.0,
                                ),
                              ),
                              padding: EdgeInsets.only(left: 150.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              "kg",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 100.0),
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_qtd <
                                          _foodList.all
                                              .elementAt(_foodDataIndex)
                                              .quantity) _qtd++;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_qtd > 1) _qtd--;
                                    });
                                  },
                                  icon: Icon(Icons.remove),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 30),
                      child: Material(
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(8.0),
                        color: MyColors.myRed,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () {
                            //atualizei a quantidade
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyRequest(_foodData, _qtd, _user),
                              ),
                            );
                            if (_foodData.quantity - _qtd != 0) {
                              _foodList.put(
                                Food(
                                  id: _foodData.id,
                                  type: _foodData.type,
                                  name: _foodData.name,
                                  finality: _foodData.finality,
                                  donor: _foodData.donor,
                                  date: _foodData.date,
                                  quantity: _foodData.quantity - _qtd,
                                ),
                              );
                            } else {
                              _foodList.remove(_foodData);
                            }
                          },
                          child: Text(
                            S.of(context).request,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
