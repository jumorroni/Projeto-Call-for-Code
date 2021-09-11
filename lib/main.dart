import 'package:c4c/generated/l10n.dart';
import 'package:c4c/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:c4c/routes/app_route.dart';
import 'package:c4c/views/login.dart';
import 'package:c4c/views/register.dart';
import 'package:provider/provider.dart';
import 'package:c4c/provider/users.dart';
import 'package:c4c/provider/foods.dart' as food;
import 'package:c4c/provider/requests.dart';
import 'package:c4c/components/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  double w = 400;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => food.Foods(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => RequestsProvider(),
        ),
      ],
      child: Center(
        child: SizedBox(
          child: MaterialApp(
            title: 'Give & Receive',
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              primarySwatch: MyColors.myRed,
              backgroundColor: MyColors.myWhite,
            ),
            routes: {
              AppRoutes.LOGIN: (_) => MyLoginPage(),
              AppRoutes.REGISTER: (_) => MyRegister(),
            },
            home: MySplash(),
          ),
          width: w,
          height: w * 16 / 9,
        ),
      ),
    );
  }
}
