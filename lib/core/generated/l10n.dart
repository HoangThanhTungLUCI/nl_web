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

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Choose something`
  String get choose_something {
    return Intl.message(
      'Choose something',
      name: 'choose_something',
      desc: '',
      args: [],
    );
  }

  /// `Connecting...`
  String get connecting {
    return Intl.message(
      'Connecting...',
      name: 'connecting',
      desc: '',
      args: [],
    );
  }

  /// `Connection successful!`
  String get connection_successful {
    return Intl.message(
      'Connection successful!',
      name: 'connection_successful',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Can't connect`
  String get cant_connect {
    return Intl.message(
      'Can\'t connect',
      name: 'cant_connect',
      desc: '',
      args: [],
    );
  }

  /// `Understood`
  String get understood {
    return Intl.message(
      'Understood',
      name: 'understood',
      desc: '',
      args: [],
    );
  }

  /// `No thanks`
  String get no_thanks {
    return Intl.message(
      'No thanks',
      name: 'no_thanks',
      desc: '',
      args: [],
    );
  }

  /// `Database exception`
  String get database_exception {
    return Intl.message(
      'Database exception',
      name: 'database_exception',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Connect timeout`
  String get connect_timeout {
    return Intl.message(
      'Connect timeout',
      name: 'connect_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout`
  String get receive_timeout {
    return Intl.message(
      'Receive timeout',
      name: 'receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout`
  String get send_timeout {
    return Intl.message(
      'Send timeout',
      name: 'send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Kh??ng c?? k???t n???i m???ng`
  String get connection_problem {
    return Intl.message(
      'Kh??ng c?? k???t n???i m???ng',
      name: 'connection_problem',
      desc: '',
      args: [],
    );
  }

  /// `Vui l??ng ki???m tra l???i t??n hi???u Wifi ho???c 3G/4G c???a b???n.`
  String get connection_problem_desc {
    return Intl.message(
      'Vui l??ng ki???m tra l???i t??n hi???u Wifi ho???c 3G/4G c???a b???n.',
      name: 'connection_problem_desc',
      desc: '',
      args: [],
    );
  }

  /// `Server not found`
  String get server_not_found {
    return Intl.message(
      'Server not found',
      name: 'server_not_found',
      desc: '',
      args: [],
    );
  }

  /// `H??? th???ng c?? ch??t v???n ?????`
  String get server_unknown_error {
    return Intl.message(
      'H??? th???ng c?? ch??t v???n ?????',
      name: 'server_unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Server ho???t ?????ng ngon`
  String get server_successfully {
    return Intl.message(
      'Server ho???t ?????ng ngon',
      name: 'server_successfully',
      desc: '',
      args: [],
    );
  }

  /// `?????? ?????????? ?????????????? {appleOne} ?? {appleTwo}`
  String wozniakBio(Object appleOne, Object appleTwo) {
    return Intl.message(
      '?????? ?????????? ?????????????? $appleOne ?? $appleTwo',
      name: 'wozniakBio',
      desc: '',
      args: [appleOne, appleTwo],
    );
  }

  /// `{count,plural, =0{???? ???????? ?????????? ??????} =1{?????? {count}} =2{??????????} few{{count} ??????????} many{{count} ??????} other{{count} ??????}`
  String heroCount(Object count) {
    return Intl.message(
      '{count,plural, =0{???? ???????? ?????????? ??????} =1{?????? $count} =2{??????????} few{$count ??????????} many{$count ??????} other{$count ??????}',
      name: 'heroCount',
      desc: '',
      args: [count],
    );
  }

  /// `????????????: {value}`
  String itemTotal(Object value) {
    return Intl.message(
      '????????????: $value',
      name: 'itemTotal',
      desc: '',
      args: [value],
    );
  }

  /// `?????????? ?????????????? {date}`
  String heroBorn(Object date) {
    return Intl.message(
      '?????????? ?????????????? $date',
      name: 'heroBorn',
      desc: '',
      args: [date],
    );
  }

  /// `B??i vi???t`
  String get posts {
    return Intl.message(
      'B??i vi???t',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `Ch??a c?? d??? li???u`
  String get data_empty {
    return Intl.message(
      'Ch??a c?? d??? li???u',
      name: 'data_empty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vn'),
      Locale.fromSubtags(languageCode: 'en'),
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
