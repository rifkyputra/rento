extension DateTimeXt on DateTime {
  int toEpochSecond() {
    return millisecondsSinceEpoch ~/ 100;
  }

  static DateTime fromSecondEpoch(int secondEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(secondEpoch * 100);
  }
}
