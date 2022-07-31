import 'package:equatable/equatable.dart';
import 'package:rento/src/extensions/datetime_xt.dart';

class TimeDuration {
  TimeDuration({
    required DateTime start,
    required DateTime end,
  })  : _start = start,
        _end = end;

  DateTime _start;
  DateTime _end;

  DateTime get start => _start;
  DateTime get end => _end;

  Duration get duration => _end.difference(_start);

  update({
    DateTime? start,
    DateTime? end,
    Duration? duration,
  }) {
    if (start != null) _start = start;

    if (duration != null) {
      _end = (start ?? _start).add(duration);
    } else if (end != null) {
      _end = end;
    } else {
      _end = _end.isBefore(_start) ? _start : _end;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'start': _start.toEpochSecond(),
      'end': _end.toEpochSecond(),
      'durationMinutes': duration.inMinutes,
    }..removeWhere((_, v) => v == null);
  }

  factory TimeDuration.fromJson(Map<String, dynamic> map) {
    return TimeDuration(
        start: DateTimeXt.fromSecondEpoch(map['start']),
        end: DateTimeXt.fromSecondEpoch(map['end']));
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
