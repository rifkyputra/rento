import 'package:flutter/foundation.dart';
import 'package:rento/src/select_time/select_time_model.dart';

import 'package:rento/src/select_time/select_time_service.dart';

class SelectTimeController with ChangeNotifier {
  SelectTimeController(this._timeService, TimeDuration timeDuration)
      : _timeDuration = timeDuration;

  final SelectTimeService _timeService;

  final TimeDuration _timeDuration;

  Hands? _hands;
  int? _handValue;
  String? _title;

  Hands? get hands => _hands;
  int? get handValue => _handValue;
  String? get title => _title;
  DateTime get start => _timeDuration.start;
  DateTime get end => _timeDuration.end;
  Duration get duration => _timeDuration.duration;

  updateTimeDuration({
    required DateTime start,
    DateTime? end,
    Duration? duration,
  }) {
    _timeDuration.update(duration: duration, start: start, end: end);

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

    return updateTimeDuration(start: _timeDuration.start, duration: duration);
  }

  updateLocal() {
    _timeService.saveLocal(_timeDuration, title ?? 'No title');
    notifyListeners();
    _timeService.submitData(_timeDuration, title ?? 'No title');
    notifyListeners();
  }

  updateTitle(String input) {
    _title = input;

    notifyListeners();
  }
}




// class HandValue extends Equatable {

