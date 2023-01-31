import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeUtil {
  static const second = 1000;
  static const fifteenSeconds = 15 * second;

  static const formatFull = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static const formatSimple = "dd MMM yyyy";

  static const _locale = 'id_ID';

  Future<String> translateDateTime(
    String dateTime, {
    String fromFormat = formatFull,
    String toFormat = formatSimple,
  }) async {
    await initializeDateFormatting(_locale, null);

    try {
      var dt = DateFormat(fromFormat).parse(dateTime);
      return DateFormat(toFormat, _locale).format(dt);
    } on FormatException catch(_) {
      return dateTime;
    }
  }
}
