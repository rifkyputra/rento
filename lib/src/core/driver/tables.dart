import 'package:drift/drift.dart';

@DataClassName('TimeScheme')
class TimeDurationDef extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get durationMinutes => integer()();
  IntColumn get start => integer()();
  IntColumn get end => integer()();
}

@DataClassName('RentTrx')
class RentTrxDef extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get durationMinutes => integer().nullable()();
  IntColumn get start => integer().nullable()();
  IntColumn get end => integer().nullable()();
  TextColumn get currency => text().nullable()();
  BoolColumn get autoRepeat => boolean().withDefault(const Constant(false))();
  IntColumn get value => integer().nullable()();
}
