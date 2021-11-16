import 'package:github_challenge/injection_container/injection.dart';
import 'package:intl/intl.dart';

DateTime? dateTimeFromJson(String? dateTime) {
  if (dateTime != null) {
    try {
      return sl<DateFormat>(
        param1: sl<String>(instanceName: 'DatePattern'),
      ).parse(dateTime);
    } catch (e) {
      return null;
    }
  }
  return null;
}

String? dateTimetojson(DateTime? dateTime) {
  if (dateTime != null) {
    try {
      return sl<DateFormat>(param1: sl<String>(instanceName: 'DatePattern'))
          .format(dateTime);
    } catch (e) {
      return null;
    }
  }
}
