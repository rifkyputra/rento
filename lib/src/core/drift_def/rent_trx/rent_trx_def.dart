import 'package:drift/drift.dart';

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
