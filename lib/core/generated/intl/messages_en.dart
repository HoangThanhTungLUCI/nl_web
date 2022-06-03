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

  static String m0(date) => "Born ${date}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'No heroes yet', one: '1 hero', other: '${count} heroes')}";

  static String m2(value) => "Your total is: ${value}";

  static String m3(appleOne, appleTwo) =>
      "Developed the ${appleOne} & ${appleTwo} microcomputers.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
        "cant_connect": MessageLookupByLibrary.simpleMessage("Can\'t connect"),
        "choose_something":
            MessageLookupByLibrary.simpleMessage("Choose something"),
        "connect_timeout":
            MessageLookupByLibrary.simpleMessage("Connect timeout"),
        "connecting": MessageLookupByLibrary.simpleMessage("Connecting..."),
        "connection_problem":
            MessageLookupByLibrary.simpleMessage("connection problem"),
        "connection_problem_desc":
            MessageLookupByLibrary.simpleMessage("connection problem desc"),
        "connection_successful":
            MessageLookupByLibrary.simpleMessage("Connection successful!"),
        "data_empty": MessageLookupByLibrary.simpleMessage("Data is empty"),
        "database_exception":
            MessageLookupByLibrary.simpleMessage("Database exception"),
        "heroBorn": m0,
        "heroCount": m1,
        "itemTotal": m2,
        "no_thanks": MessageLookupByLibrary.simpleMessage("No thanks"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "posts": MessageLookupByLibrary.simpleMessage("Posts"),
        "receive_timeout":
            MessageLookupByLibrary.simpleMessage("Receive timeout"),
        "send_timeout": MessageLookupByLibrary.simpleMessage("Send timeout"),
        "server_not_found":
            MessageLookupByLibrary.simpleMessage("Server not found"),
        "server_successfully":
            MessageLookupByLibrary.simpleMessage("server successfully"),
        "server_unknown_error":
            MessageLookupByLibrary.simpleMessage("server unknown error"),
        "understood": MessageLookupByLibrary.simpleMessage("Understood"),
        "warning": MessageLookupByLibrary.simpleMessage("Warning"),
        "wozniakBio": m3
      };
}
