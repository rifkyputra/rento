import 'package:drift/drift.dart';
// import 'package:drift/web.dart';
// import 'package:flutter/foundation.dart';
import 'package:rento/src/core/driver/tables.dart';

// import 'package:drift/drift.dart';
// import 'package:drift/wasm.dart';
// import 'package:http/http.dart' as http;
// import 'package:sqlite3/wasm.dart';
import 'connection/connection.dart' as impl;

part 'drift_driver.g.dart';

@DriftDatabase(tables: [TimeDurationDef, RentTrxDef])
class SqliteDatabase extends _$SqliteDatabase {
  // we tell the database where to store the data with this constructor
  SqliteDatabase() : super(impl.connect().executor);

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 3;

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

// LazyDatabase _openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase(file);
//     // return WebDatabase('app');

//     // Load wasm bundle
//     // final response = await http.get(Uri.parse('sqlite3.wasm'));
//     // // Create a virtual file system backed by IndexedDb with everything in
//     // // `/drift/my_app/` being persisted.
//     // final fs = await IndexedDbFileSystem.open(dbName: 'my_app');
//     // final sqlite3 = await WasmSqlite3.load(
//     //   response.bodyBytes,
//     //   SqliteEnvironment(fileSystem: fs),
//     // );

//     // // Then, open a database inside that persisted folder.
//     // return WasmDatabase(sqlite3: sqlite3, path: '/drift/my_app/app.db');
//   });
// }
