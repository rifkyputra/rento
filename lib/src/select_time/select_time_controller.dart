import 'package:flutter/foundation.dart';
import 'package:rento/src/select_time/select_time_service.dart';
import 'package:equatable/equatable.dart';

class SelectTimeController with ChangeNotifier {
  SelectTimeController(
    this._timeService, {
    required this.timeDuration,
  });

  final SelectTimeService _timeService;

  TimeDuration timeDuration;
  Hands? _hands;

  Hands? get hands => _hands;

  updateTimeDuration({
    required DateTime start,
    DateTime? end,
    Duration? duration,
  }) {
    late final TimeDuration newTime;
    if (duration != null) {
      newTime = TimeDuration(start: start, end: start.add(duration));
    } else if (end != null) {
      newTime = TimeDuration(start: start, end: end);
    } else {
      newTime = TimeDuration(
        start: start,
        end: timeDuration.end.isBefore(start) ? start : timeDuration.end,
      );
    }

    timeDuration = newTime;

    _timeService.saveLocal(newTime);
    _timeService.submitData(newTime);
    notifyListeners();

    return notifyListeners();
  }

  updateHands(int value, Hands hand) {
    _hands = hand;

    late final Duration duration;
    switch (hand) {
      case Hands.minute:
        duration = Duration(minutes: value);
        break;
      case Hands.hour:
        duration = Duration(hours: value);
        break;
      case Hands.week:
        duration = Duration(days: value * 7);
        break;
      case Hands.month:
        duration = Duration(days: value * 30);
        break;
      case Hands.year:
        duration = Duration(days: value * 30 * 12);
        break;
      case Hands.days:
        duration = Duration(days: value);
        break;
    }
    print(duration);

    return updateTimeDuration(start: timeDuration.start, duration: duration);
  }
}

enum Hands {
  minute,
  hour,
  days,
  week,
  month,
  year,
}

class TimeDuration extends Equatable {
  final DateTime start;
  final DateTime end;

  const TimeDuration({
    required this.start,
    required this.end,
  });

  Duration get duration => end.difference(start);

  @override
  List<Object?> get props => [
        start,
        end,
      ];
}
