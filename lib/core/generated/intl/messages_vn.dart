// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vn locale. All the
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
  String get localeName => 'vn';

  static String m0(date) => "تاريخ الميلاد ${date}";

  static String m1(count) =>
      "{count,plural, =0{لا توجد أبطال بعد} =1{بطل ${count}} =2{بطلان} few{${count} أبطال} many{${count} بطل} other{${count} بطل}";

  static String m2(value) => "إجمالي: ${value}";

  static String m3(appleOne, appleTwo) =>
      "طور جهازي كمبيوتر ${appleOne} و ${appleTwo}";

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
            MessageLookupByLibrary.simpleMessage("Không có kết nối mạng"),
        "connection_problem_desc": MessageLookupByLibrary.simpleMessage(
            "Vui lòng kiểm tra lại tín hiệu Wifi hoặc 3G/4G của bạn."),
        "connection_successful":
            MessageLookupByLibrary.simpleMessage("Connection successful!"),
        "data_empty": MessageLookupByLibrary.simpleMessage("Chưa có dữ liệu"),
        "database_exception":
            MessageLookupByLibrary.simpleMessage("Database exception"),
        "heroBorn": m0,
        "heroCount": m1,
        "itemTotal": m2,
        "no_thanks": MessageLookupByLibrary.simpleMessage("No thanks"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "posts": MessageLookupByLibrary.simpleMessage("Bài viết"),
        "receive_timeout":
            MessageLookupByLibrary.simpleMessage("Receive timeout"),
        "send_timeout": MessageLookupByLibrary.simpleMessage("Send timeout"),
        "server_not_found":
            MessageLookupByLibrary.simpleMessage("Server not found"),
        "server_successfully":
            MessageLookupByLibrary.simpleMessage("Server hoạt động ngon"),
        "server_unknown_error":
            MessageLookupByLibrary.simpleMessage("Hệ thống có chút vấn đề"),
        "understood": MessageLookupByLibrary.simpleMessage("Understood"),
        "warning": MessageLookupByLibrary.simpleMessage("Warning"),
        "wozniakBio": m3
      };
}
