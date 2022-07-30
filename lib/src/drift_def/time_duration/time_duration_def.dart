import 'package:drift/drift.dart';

@DataClassName('TimeScheme')
class TimeDurationDef extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get durationMinutes => integer()();
  IntColumn get start => integer()();
  IntColumn get epoch => integer()();
}
