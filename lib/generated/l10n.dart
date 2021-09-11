// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign in`
  String get login {
    return Intl.message(
      'Sign in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Already an user?`
  String get already {
    return Intl.message(
      'Already an user?',
      name: 'already',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get mail {
    return Intl.message(
      'Mail',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm {
    return Intl.message(
      'Confirm password',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get postal {
    return Intl.message(
      'Postal Code',
      name: 'postal',
      desc: '',
      args: [],
    );
  }

  /// `Registered successfully!`
  String get registrationSuccess {
    return Intl.message(
      'Registered successfully!',
      name: 'registrationSuccess',
      desc: '',
      args: [],
    );
  }

  /// `It is our responsibility to take steps not only to check all types of waste, but also to protect natural resources.`
  String get itIsOur {
    return Intl.message(
      'It is our responsibility to take steps not only to check all types of waste, but also to protect natural resources.',
      name: 'itIsOur',
      desc: '',
      args: [],
    );
  }

  /// `We believe that the world moves according to the conscience of each one`
  String get weBelieve {
    return Intl.message(
      'We believe that the world moves according to the conscience of each one',
      name: 'weBelieve',
      desc: '',
      args: [],
    );
  }

  /// `My statistics`
  String get statistics {
    return Intl.message(
      'My statistics',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `1000 kg of food waste causes approximately the emission of 2500kg of CO2`
  String get m1000kg {
    return Intl.message(
      '1000 kg of food waste causes approximately the emission of 2500kg of CO2',
      name: 'm1000kg',
      desc: '',
      args: [],
    );
  }

  /// `According to Food & Agriculture Organization of the United Nations (FAO) from 2013, food waste is the third highest emitter of GHG emissions`
  String get according {
    return Intl.message(
      'According to Food & Agriculture Organization of the United Nations (FAO) from 2013, food waste is the third highest emitter of GHG emissions',
      name: 'according',
      desc: '',
      args: [],
    );
  }

  /// `1.75 tons of food waste per year`
  String get m175 {
    return Intl.message(
      '1.75 tons of food waste per year',
      name: 'm175',
      desc: '',
      args: [],
    );
  }

  /// `Available foods`
  String get available {
    return Intl.message(
      'Available foods',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `Add food`
  String get add {
    return Intl.message(
      'Add food',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `My requests`
  String get requests {
    return Intl.message(
      'My requests',
      name: 'requests',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameFood {
    return Intl.message(
      'Name',
      name: 'nameFood',
      desc: '',
      args: [],
    );
  }

  /// `Finality`
  String get finality {
    return Intl.message(
      'Finality',
      name: 'finality',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message(
      'Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Request Details`
  String get detail {
    return Intl.message(
      'Request Details',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Deadline`
  String get deadline {
    return Intl.message(
      'Deadline',
      name: 'deadline',
      desc: '',
      args: [],
    );
  }

  /// `Pickup Address`
  String get pickup {
    return Intl.message(
      'Pickup Address',
      name: 'pickup',
      desc: '',
      args: [],
    );
  }

  /// `Donor name`
  String get donorName {
    return Intl.message(
      'Donor name',
      name: 'donorName',
      desc: '',
      args: [],
    );
  }

  /// `Donor contact`
  String get donorContact {
    return Intl.message(
      'Donor contact',
      name: 'donorContact',
      desc: '',
      args: [],
    );
  }

  /// `Thank you, you are helping to reduce waste and encourage conscientious consumption!`
  String get thankYou {
    return Intl.message(
      'Thank you, you are helping to reduce waste and encourage conscientious consumption!',
      name: 'thankYou',
      desc: '',
      args: [],
    );
  }

  /// `My request`
  String get myRequest {
    return Intl.message(
      'My request',
      name: 'myRequest',
      desc: '',
      args: [],
    );
  }

  /// `Expire date`
  String get expire {
    return Intl.message(
      'Expire date',
      name: 'expire',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get addButton {
    return Intl.message(
      'Add',
      name: 'addButton',
      desc: '',
      args: [],
    );
  }

  /// `Food added successfully!`
  String get addSuccess {
    return Intl.message(
      'Food added successfully!',
      name: 'addSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Type required`
  String get typeReq {
    return Intl.message(
      'Type required',
      name: 'typeReq',
      desc: '',
      args: [],
    );
  }

  /// `Quantity required`
  String get quantityReq {
    return Intl.message(
      'Quantity required',
      name: 'quantityReq',
      desc: '',
      args: [],
    );
  }

  /// `Name required`
  String get nameReq {
    return Intl.message(
      'Name required',
      name: 'nameReq',
      desc: '',
      args: [],
    );
  }

  /// `Finality required`
  String get finalityReq {
    return Intl.message(
      'Finality required',
      name: 'finalityReq',
      desc: '',
      args: [],
    );
  }

  /// `Food required`
  String get foodReq {
    return Intl.message(
      'Food required',
      name: 'foodReq',
      desc: '',
      args: [],
    );
  }

  /// `My progress`
  String get progress {
    return Intl.message(
      'My progress',
      name: 'progress',
      desc: '',
      args: [],
    );
  }

  /// `Waste`
  String get waste {
    return Intl.message(
      'Waste',
      name: 'waste',
      desc: '',
      args: [],
    );
  }

  /// `Economy`
  String get economy {
    return Intl.message(
      'Economy',
      name: 'economy',
      desc: '',
      args: [],
    );
  }

  /// `food`
  String get food {
    return Intl.message(
      'food',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `Mail required`
  String get emailReq {
    return Intl.message(
      'Mail required',
      name: 'emailReq',
      desc: '',
      args: [],
    );
  }

  /// `Invalid mail`
  String get emailInvalid {
    return Intl.message(
      'Invalid mail',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password required`
  String get passwordReq {
    return Intl.message(
      'Password required',
      name: 'passwordReq',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get mailOrPassword {
    return Intl.message(
      'Invalid email or password',
      name: 'mailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone required`
  String get phoneReq {
    return Intl.message(
      'Phone required',
      name: 'phoneReq',
      desc: '',
      args: [],
    );
  }

  /// `Mail Required`
  String get mailReq {
    return Intl.message(
      'Mail Required',
      name: 'mailReq',
      desc: '',
      args: [],
    );
  }

  /// `Invalid mail`
  String get mailInvalid {
    return Intl.message(
      'Invalid mail',
      name: 'mailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordDont {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordDont',
      desc: '',
      args: [],
    );
  }

  /// `Country required`
  String get countryReq {
    return Intl.message(
      'Country required',
      name: 'countryReq',
      desc: '',
      args: [],
    );
  }

  /// `State required`
  String get stateReq {
    return Intl.message(
      'State required',
      name: 'stateReq',
      desc: '',
      args: [],
    );
  }

  /// `Password required`
  String get cityReq {
    return Intl.message(
      'Password required',
      name: 'cityReq',
      desc: '',
      args: [],
    );
  }

  /// `Address required`
  String get addressReq {
    return Intl.message(
      'Address required',
      name: 'addressReq',
      desc: '',
      args: [],
    );
  }

  /// `Postal code`
  String get cep {
    return Intl.message(
      'Postal code',
      name: 'cep',
      desc: '',
      args: [],
    );
  }

  /// `Postal code required`
  String get cepReq {
    return Intl.message(
      'Postal code required',
      name: 'cepReq',
      desc: '',
      args: [],
    );
  }

  /// `Enter an address`
  String get enterAddress {
    return Intl.message(
      'Enter an address',
      name: 'enterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
