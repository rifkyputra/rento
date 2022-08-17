import 'package:drift/drift.dart';
import 'package:rento/src/core/driver/tables.dart';

import 'connection/connection.dart' as impl;

part 'drift_driver.g.dart';

@DriftDatabase(tables: [TimeDurationDef, RentTrxDef])
class SqliteDatabase extends _$SqliteDatabase {
  // we tell the database where to store the data with this constructor
  SqliteDatabase() : super(impl.connect().executor);

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 2;

  Future<List<RentTrx>> getRentTrx() => select(rentTrxDef).get();

  Future<int> insertRentTrx(RentTrx rentTrx) {
    return into(rentTrxDef).insert(
      RentTrxDefCompanion.insert(
        id: rentTrx.id,
        title: rentTrx.title,
      ),
    );
  }
}
