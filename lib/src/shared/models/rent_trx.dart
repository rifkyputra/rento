import 'package:equatable/equatable.dart';

class RentTrx extends Equatable {
  final String id;
  final String title;
  final bool autoRepeat;
  final int? start;
  final int? end;
  final int durationMinutes;

  const RentTrx({
    required this.id,
    required this.title,
    required this.durationMinutes,
    this.autoRepeat = false,
    this.start,
    this.end,
  });
  @override
  List<Object?> get props => [
        id,
        title,
        autoRepeat,
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'autoRepeat': autoRepeat,
      'start': start,
      'end': end,
      'durationMinutes': durationMinutes,
    }..removeWhere((key, value) => value == null);
  }

  static fromMap(Map map) {
    return RentTrx(
        id: map['id'],
        title: map['title'],
        durationMinutes: map['durationMinutes']);
  }
}
