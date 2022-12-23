import 'package:intl/intl.dart';

extension IntExtension on int {
  String formatToCurrency() {
    return NumberFormat.simpleCurrency(locale: "in_ID")
        .format(this)
        .replaceAll(",00", "");
  }

  String formatToDecimal() {
    return NumberFormat.decimalPattern("in_ID")
        .format(this)
        .replaceAll(",00", "");
  }
}
