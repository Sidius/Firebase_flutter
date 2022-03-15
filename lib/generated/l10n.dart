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

  /// `Home Page`
  String get home_page {
    return Intl.message(
      'Home Page',
      name: 'home_page',
      desc: '',
      args: [],
    );
  }

  /// `Login Form`
  String get login_form_title {
    return Intl.message(
      'Login Form',
      name: 'login_form_title',
      desc: '',
      args: [],
    );
  }

  /// `Login*`
  String get login_label_text {
    return Intl.message(
      'Login*',
      name: 'login_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get login_hint_text {
    return Intl.message(
      'Enter your email',
      name: 'login_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Password*`
  String get password_label_text {
    return Intl.message(
      'Password*',
      name: 'password_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get password_hint_text {
    return Intl.message(
      'Enter your password',
      name: 'password_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Name*`
  String get name_label_text {
    return Intl.message(
      'Name*',
      name: 'name_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get name_hint_text {
    return Intl.message(
      'Enter your name',
      name: 'name_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Surname*`
  String get surname_label_text {
    return Intl.message(
      'Surname*',
      name: 'surname_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your surname`
  String get surname_hint_text {
    return Intl.message(
      'Enter your surname',
      name: 'surname_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Age*`
  String get age_label_text {
    return Intl.message(
      'Age*',
      name: 'age_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your age`
  String get age_hint_text {
    return Intl.message(
      'Enter your age',
      name: 'age_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get submit_login_form {
    return Intl.message(
      'Sign in',
      name: 'submit_login_form',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get submit_logout {
    return Intl.message(
      'Logout',
      name: 'submit_logout',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_title {
    return Intl.message(
      'Email',
      name: 'email_title',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name_title {
    return Intl.message(
      'Name',
      name: 'name_title',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get surname_title {
    return Intl.message(
      'Surname',
      name: 'surname_title',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age_title {
    return Intl.message(
      'Age',
      name: 'age_title',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id_title {
    return Intl.message(
      'ID',
      name: 'id_title',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get password_is_required_message {
    return Intl.message(
      'Password is required',
      name: 'password_is_required_message',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get email_is_required_message {
    return Intl.message(
      'Email is required',
      name: 'email_is_required_message',
      desc: '',
      args: [],
    );
  }

  /// `It is not email`
  String get email_is_reg_message {
    return Intl.message(
      'It is not email',
      name: 'email_is_reg_message',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get name_is_required_message {
    return Intl.message(
      'Name is required',
      name: 'name_is_required_message',
      desc: '',
      args: [],
    );
  }

  /// `Surname is required`
  String get surname_is_required_message {
    return Intl.message(
      'Surname is required',
      name: 'surname_is_required_message',
      desc: '',
      args: [],
    );
  }

  /// `Form is not valid`
  String get form_is_not_valid {
    return Intl.message(
      'Form is not valid',
      name: 'form_is_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Hello World`
  String get hello_world {
    return Intl.message(
      'Hello World',
      name: 'hello_world',
      desc: '',
      args: [],
    );
  }

  /// `No account?`
  String get no_account_title {
    return Intl.message(
      'No account?',
      name: 'no_account_title',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get have_account_title {
    return Intl.message(
      'Already have an account?',
      name: 'have_account_title',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up_title {
    return Intl.message(
      'Sign Up',
      name: 'sign_up_title',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
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
      Locale.fromSubtags(languageCode: 'ru'),
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
