// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "email_is_reg_message":
            MessageLookupByLibrary.simpleMessage("It is not email"),
        "email_is_required_message":
            MessageLookupByLibrary.simpleMessage("Email is required"),
        "email_title": MessageLookupByLibrary.simpleMessage("Email"),
        "form_is_not_valid":
            MessageLookupByLibrary.simpleMessage("Form is not valid"),
        "hello_world": MessageLookupByLibrary.simpleMessage("Hello World"),
        "home_page": MessageLookupByLibrary.simpleMessage("Home Page"),
        "id_title": MessageLookupByLibrary.simpleMessage("ID"),
        "login_form_title": MessageLookupByLibrary.simpleMessage("Login Form"),
        "login_hint_text":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "login_label_text": MessageLookupByLibrary.simpleMessage("Login*"),
        "password_hint_text":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "password_is_required_message":
            MessageLookupByLibrary.simpleMessage("Password is required"),
        "password_label_text":
            MessageLookupByLibrary.simpleMessage("Password*"),
        "submit_login_form": MessageLookupByLibrary.simpleMessage("Sign in"),
        "submit_logout": MessageLookupByLibrary.simpleMessage("Logout")
      };
}
