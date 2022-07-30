import 'package:equatable/equatable.dart';
import 'package:rento/src/extensions/datetime_xt.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'start': start.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
      'durationMinutes': duration.inMinutes,
    };
  }

  factory TimeDuration.fromJson(Map<String, dynamic> map) {
    return TimeDuration(
      start: DateTimeXt.fromSecondEpoch(map['start']),
      end: DateTimeXt.fromSecondEpoch(map['end']),
    );
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
