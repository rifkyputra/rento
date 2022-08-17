import 'package:equatable/equatable.dart';

class TimeScheme extends Equatable {
  final String id;
  final String name;
  final int? start;
  final int? end;
  final int durationMinutes;

  TimeScheme({
    required this.id,
    required this.name,
    required this.durationMinutes,
    this.start,
    this.end,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'start': start,
      'end': end,
      'durationMinutes': durationMinutes,
    }..removeWhere((key, value) => value == null);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        start,
        end,
        durationMinutes,
      ];
}
