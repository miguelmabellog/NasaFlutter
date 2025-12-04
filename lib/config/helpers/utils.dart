class Utils {
  static String currentDateYYYYMMDD() {
    final dateTime = DateTime.now();
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year;

    return '$year-$month-$day';
  }

  static String formatDoubleToHumanFormat(double number) {
    return number.toStringAsFixed(2);
  }

  static String formatDoubleToHumanFormatString(String number) {
    return double.parse(number).toStringAsFixed(2);
  }

  static String velocityToKms(String velocity) {
    final velocityDouble = double.parse(velocity);
    return velocityDouble.toStringAsFixed(2);
  }
}
