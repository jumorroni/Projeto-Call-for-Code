//import 'dart:html';

import 'package:c4c/components/colors.dart';
import 'package:c4c/generated/l10n.dart';
import 'package:c4c/views/add.dart';
import 'package:c4c/views/available.dart';
import 'package:flutter/material.dart';
import 'package:c4c/routes/app_route.dart';
import 'dart:ui';
import 'package:c4c/views/requests.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:c4c/views/statistics.dart';
import 'package:c4c/models/user.dart';

class MyHome extends StatefulWidget {
  //const MyHome({Key? key}) : super(key: key);
  //final List _data;
  late final User user;
  MyHome(this.user);

  @override
  _MyHome createState() => _MyHome(this.user);
}

class _MyHome extends State<MyHome> {
  late final User user;
  _MyHome(this.user);
  @override
  void initState() {
    super.initState();
  }

  late CarouselSlider instance;
  late CarouselSlider instance2;
  @override
  Widget build(BuildContext context) {
    instance = new CarouselSlider(
      items: [
        Image(
          image: AssetImage('images/image1.png'),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Image(
          image: AssetImage('images/image2.png'),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Image(
          image: AssetImage('images/image3.png'),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Image(
          image: AssetImage('images/image4.png'),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Image(
          image: AssetImage('images/image5.png'),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Image(
          image: AssetImage('images/image6.png'),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Image(
          image: AssetImage('images/image7.png'),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 4000),
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.ease,
        viewportFraction: 1,
      ),
    );

    instance2 = new CarouselSlider(
      items: [
        Text(
          S.of(context).m1000kg, //aqui
          textAlign: TextAlign.justify,
        ),
        Text(
          S.of(context).m175,
          textAlign: TextAlign.justify,
        ),
        Text(
          S.of(context).according,
          textAlign: TextAlign.justify,
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 4000),
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.ease,
        viewportFraction: 1,
      ),
    );

    return Scaffold(
      drawer: _createDrawer(context),
      body: _createBody(),
      appBar: AppBar(
          backgroundColor: MyColors.myWhite,
          toolbarHeight: 70,
          title: Text(
            'Give and Receive',
            style: TextStyle(
              fontSize: 34,
              color: MyColors.myRed,
              fontWeight: FontWeight.w900,
            ),
          ),
          iconTheme: IconThemeData(color: MyColors.myRed)),
    );
  }

  Widget _createBody() {
    return ListView(
      children: [
        Padding(padding: EdgeInsets.all(0)),
        instance,
        Container(
          padding: EdgeInsets.all(30),
          child: Text(
            S.of(context).itIsOur,
            textAlign: TextAlign.justify,
          ),
          color: MyColors.myWhite,
          width: 500,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                    S.of(context).weBelieve,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  width: 200,
                ),
                Center(
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(40),
                    color: MyColors.myRed,
                    child: MaterialButton(
                      minWidth: 140,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyStatistics(user)));
                      },
                      child: Text(
                        S.of(context).statistics,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Material(
                  elevation: 8.0,
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Image(
                      image: ExactAssetImage('images/woman.png'),
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 140,
          width: double.infinity,
          padding: EdgeInsets.all(40),
          color: MyColors.myWhite,
          child: instance2,
        ),
      ],
    );
  }

  Widget _createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.myRed,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundColor: MyColors.myWhite,
                    radius: 50,
                    backgroundImage: AssetImage("images/logo.png"),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "G&R",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight + Alignment(0, .6),
                  child: Text(
                    "Give & Receive",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(S.of(context).available),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodsAvailable(user)));
            },
            leading: Icon(Icons.store),
          ),
          ListTile(
            title: Text(S.of(context).add),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAddPage(user)));
            },
            leading: Icon(Icons.add_box),
          ),
          ListTile(
            title: Text(S.of(context).requests),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyRequests(user)));
            },
            leading: Icon(Icons.receipt),
          ),
          ListTile(
            title: Text(S.of(context).settings),
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
