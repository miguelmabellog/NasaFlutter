class Utils {
  static String currentDateYYYYMMDD() {
    final dateTime = DateTime.now();
    final day = dateTime.day;
    final month = dateTime.month;
    final year = dateTime.year;

    return '$year-$month-$day';
  }
}
