import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:c4c/components/colors.dart';
import 'package:c4c/generated/l10n.dart';
import 'package:c4c/models/address.dart';
import 'package:c4c/models/user.dart';
import 'package:c4c/provider/users.dart';
import 'package:c4c/views/home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:c4c/database/helper.dart' as h;

class MyRegister extends StatefulWidget {
  @override
  _MyRegister createState() => _MyRegister();
}

class _MyRegister extends State<MyRegister> {
  final TextEditingController telController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  h.Helper helper = h.Helper();
  Map _formData = {};

  var _senha = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.grey,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.myWhite,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(190),
                        bottomRight: Radius.circular(190)),
                  ),
                  width: 500,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: MyColors.myWhite,
                    radius: 10,
                    backgroundImage: AssetImage("images/logo.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 15.0),
                  child: TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      labelText: S.of(context).name,
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).nameReq;
                      } else if (value.trim().length < 5) {
                        return "Min. 5 characters";
                      }

                      _formData['name'] = value;

                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 15.0),
                  child: TextFormField(
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      labelText: S.of(context).phone,
                    ),
                    controller: telController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).phoneReq;
                      }
                      _formData['phone'] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 15.0),
                  child: TextFormField(
                    onSaved: (value) => _formData['email'] = value,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      labelText: S.of(context).mail,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).mailReq;
                      } else if (!EmailValidator.validate(value)) {
                        return S.of(context).mailInvalid;
                      }
                      _formData['mail'] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 15.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      labelText: S.of(context).password,
                    ),
                    controller: passwordController1,
                    validator: (value) {
                      if (value != null) _senha = value;
                      if (value!.isEmpty) {
                        return S.of(context).passwordReq;
                      }

                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 15.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      labelText: S.of(context).confirm,
                    ),
                    controller: passwordController2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).passwordReq;
                      } else if (_senha != value) {
                        return S.of(context).passwordDont;
                      }
                      _formData['password'] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 15.0),
                  child: TextFormField(
                    onSaved: (value) => _formData['address']['country'] = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      labelText: S.of(context).country,
                    ),
                    controller: addressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).countryReq;
                      }
                      _formData['country'] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 15.0),
                  child: TextFormField(
                    onSaved: (value) => _formData['address']['state'] = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      labelText: S.of(context).state,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).stateReq;
                      }
                      _formData['state'] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      labelText: S.of(context).city,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).cityReq;
                      }
                      _formData['city'] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      labelText: 'Address',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).addressReq;
                      }
                      _formData['address'] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 1.0, 40.0, 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                      labelText: S.of(context).cep,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).cepReq;
                      }

                      _formData['postal'] = value;
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(8.0),
                    color: MyColors.myRed,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        bool isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          h.User u = h.User();
                          h.Address a = h.Address();

                          // a.country = _formData['country'];
                          // a.city = _formData['city'];
                          // a.state = _formData['state'];
                          // a.address = _formData['address'];
                          // a.postal = _formData['postal'];
                          // a.id = 0;

                          // u.name = _formData['name'];
                          // u.phone = _formData['phone'];
                          // u.email = _formData['email'];
                          // u.password = _formData["password"];
                          // u.id = 0;
                          // u.addressID = a.id;
                          // helper.saveAddress(a);
                          // helper.saveUser(u);
                          User user = User(
                            id: '',
                            name: _formData['name'],
                            phone: _formData['phone'],
                            email: _formData['email'],
                            address: Address(
                              name: 'my home',
                              country: _formData['country'],
                              city: _formData['city'],
                              state: _formData['state'],
                              address: _formData['address'],
                              postal: _formData['postal'],
                            ),
                            password: _formData['password'],
                          );

                          final Users users =
                              Provider.of(context, listen: false);
                          users.put(user);

                          // helper.getAllAddress().then((list) {
                          //   print(list.length);
                          // });
                          helper.getAllUsers().then((list) {
                            print(list.length);
                          });
                          final snack = SnackBar(
                            content: Text(S.of(context).registrationSuccess),
                            action: SnackBarAction(
                                label: "",
                                textColor: Colors.white,
                                onPressed: () {}),
                            duration: Duration(seconds: 2),
                          );

                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHome(user),
                            ),
                          );
                        }
                      },
                      child: Text(
                        S.of(context).signup,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  S.of(context).already,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    S.of(context).login,
                    style: TextStyle(
                      color: MyColors.myRed,
                      fontWeight: FontWeight.bold,
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
