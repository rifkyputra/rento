import 'package:drift/drift.dart';

@DataClassName('RentTrx')
class RentTrxDef extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get durationMinutes => integer()();
  IntColumn get start => integer()();
  IntColumn get end => integer()();
  TextColumn get currency => text()();
  BoolColumn get autoRepeat => boolean().withDefault(const Constant(false))();
  IntColumn get value => integer()();
}
