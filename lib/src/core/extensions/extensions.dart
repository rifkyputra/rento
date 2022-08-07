extension DateTimeXt on DateTime {
  int get toEpochSecond {
    return millisecondsSinceEpoch ~/ 100;
  }

  static DateTime fromSecondEpoch(int secondEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(secondEpoch * 100);
  }
}
