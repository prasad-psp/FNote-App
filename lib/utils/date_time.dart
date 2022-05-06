import 'package:intl/intl.dart';

class DateTimeHandler {
  static get date {
    return DateFormat("dd-MM-yyyy").format(DateTime.now());
  }

  static get time {
    return DateFormat("HH:mm:ss").format(DateTime.now());
  }
}
