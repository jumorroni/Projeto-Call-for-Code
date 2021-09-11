import 'dart:io';

import 'package:c4c/components/colors.dart';
import 'package:c4c/generated/l10n.dart';
import 'package:c4c/models/user.dart';
import 'package:c4c/views/home.dart';
import 'package:flutter/material.dart';
import 'package:c4c/provider/foods.dart';
import 'package:c4c/models/food.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class MyAddPage extends StatefulWidget {
  late final User _user;
  MyAddPage(this._user);

  @override
  _MyAddPage createState() => _MyAddPage(this._user);
}

class _MyAddPage extends State<MyAddPage> {
  Map _formData = {};
  late final User _user;
  _MyAddPage(this._user);
  TextEditingController typeController = TextEditingController();
  TextEditingController qtdController = TextEditingController();
  TextEditingController foodController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late DateTime selectedDate = DateTime.now();

  @override
  initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Widget build(BuildContext context) {
    final Foods _foodList = Provider.of(context);
    late File imagem = File('images/logo.png');
    late Image logo = Image.asset('images/logo.png');
    int temImagem = 0;

    PickedFile? imagemTemporaria;

    //type == 1: galeria
    //type == 0: camera
    void pegarImagem(int type) async {
      final picker = ImagePicker();
      imagemTemporaria = await picker.getImage(
        source: type == 1 ? ImageSource.gallery : ImageSource.camera,
        maxWidth: 200,
        maxHeight: 200,
        imageQuality: 50,
      );
      setState(() {
        imagem = File(imagemTemporaria!.path);
        temImagem = 1;
      });
    }

    Widget carregaImagem() {
      if (temImagem == 1) {
        return Image.file(
          imagem,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        );
      } else {
        return logo;
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: ClipRect(
                        child: carregaImagem(),
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.local_see),
                          onPressed: () {
                            pegarImagem(0);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.collections),
                          onPressed: () {
                            pegarImagem(1);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25.0, 1.0, 25.0, 10.0),
                  child: TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: S.of(context).type,
                    ),
                    controller: typeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).typeReq;
                      }
                      _formData["type"] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25.0, 1.0, 25.0, 10.0),
                  child: TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: S.of(context).nameFood,
                    ),
                    controller: foodController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).foodReq;
                      }
                      _formData["food"] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25.0, 1.0, 25.0, 10.0),
                  child: TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: S.of(context).finality,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).finalityReq;
                      }
                      _formData["finality"] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25.0, 1.0, 25.0, 10.0),
                  child: InputDatePickerFormField(
                    fieldLabelText: S.of(context).deadline,
                    firstDate: DateTime(2019),
                    lastDate: DateTime(selectedDate.year, 12, 12),
                    initialDate: selectedDate,
                    onDateSubmitted: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25.0, 1.0, 25.0, 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: S.of(context).quantity + ' (kg)',
                    ),
                    controller: qtdController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).quantityReq;
                      } else if (int.parse(value) >= 100) {
                        return "Max 99";
                      } else if (int.parse(value) < 1) {
                        return "Min 1";
                      }
                      _formData["quantity"] = value;
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
                  child: Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(8.0),
                    color: MyColors.myRed,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 20,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Food food = Food(
                            id: '',
                            type: _formData["type"],
                            name: _formData["food"],
                            date: selectedDate.toString(),
                            quantity: int.parse(_formData["quantity"]),
                            finality: _formData["finality"],
                            donor: _user,
                          );
                          _foodList.put(food);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHome(_user)));

                          final snack = SnackBar(
                            content: Text(S.of(context).addSuccess),
                            action: SnackBarAction(
                                label: "",
                                textColor: Colors.white,
                                onPressed: () {}),
                            duration: Duration(seconds: 2),
                          );

                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                        }
                      },
                      child: Text(
                        S.of(context).addButton,
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
      ),
      backgroundColor: Colors.white,
    );
  }
}
