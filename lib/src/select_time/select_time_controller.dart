import 'package:flutter/foundation.dart';
import 'package:rento/src/select_time/select_time_model.dart';

import 'package:rento/src/select_time/select_time_service.dart';

class SelectTimeController with ChangeNotifier {
  SelectTimeController(
    this._timeService, {
    required this.timeDuration,
  });

  final SelectTimeService _timeService;

  TimeDuration timeDuration;
  Hands? _hands;
  int? _handValue;
  DateTime? _recentlyUpdatedWheels;

  Hands? get hands => _hands;
  int? get handValue => _handValue;
  DateTime? get recentlyUpdatedWheels => _recentlyUpdatedWheels;

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

    notifyListeners();

    return notifyListeners();
  }

  updateTimeDurationFromWheel(
    int value,
    Hands hand,
  ) {
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

    return updateTimeDuration(start: timeDuration.start, duration: duration);
  }

  updateLocal() {
    _timeService.saveLocal(timeDuration);
    _timeService.submitData(timeDuration);
  }
}




// class HandValue extends Equatable {

