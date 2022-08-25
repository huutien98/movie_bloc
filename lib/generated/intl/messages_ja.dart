// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "back": MessageLookupByLibrary.simpleMessage("back"),
        "error": MessageLookupByLibrary.simpleMessage("error"),
        "ok": MessageLookupByLibrary.simpleMessage("ok"),
        "request_cancelled":
            MessageLookupByLibrary.simpleMessage("Request Cancelled"),
        "request_connect_timeout":
            MessageLookupByLibrary.simpleMessage("Request Connect Timeout"),
        "request_fail_due_internet":
            MessageLookupByLibrary.simpleMessage("Request Fail Due Internet"),
        "request_receive_timeout":
            MessageLookupByLibrary.simpleMessage("Request Receive Timeout"),
        "request_send_timeout":
            MessageLookupByLibrary.simpleMessage("Request send timeOut")
      };
}
