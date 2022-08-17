// import 'package:drift/drift.dart';
// import 'package:rento/src/core/driver/tables.dart';

// import 'connection/connection.dart' as impl;

// part 'drift_driver.g.dart';

// @DriftDatabase(tables: [TimeDurationDef, RentTrxDef])
// class SqliteDatabase extends _$SqliteDatabase {
//   // we tell the database where to store the data with this constructor
//   SqliteDatabase() : super(impl.connect().executor);

//   // you should bump this number whenever you change or add a table definition.
//   // Migrations are covered later in the documentation.
//   @override
//   int get schemaVersion => 4;

//   // @override
//   // MigrationStrategy get migration {
//   //   return MigrationStrategy(
//   //     onUpgrade: ((m, from, to) async {
//   //       if (from == 1) {
//   //         // The todoEntries.dueDate column was added in version 2.
//   //         // await m.addColumn(todoEntries, todoEntries.dueDate);
//   //       }
//   //     }),
//   //     beforeOpen: (details) async {
//   //       // Make sure that foreign keys are enabled
//   //       // await customStatement('PRAGMA foreign_keys = ON');

//   //       // if (details.wasCreated) {
//   //       //   // Create a bunch of default values so the app doesn't look too empty
//   //       //   // on the first start.
//   //       //   await batch((b) {
//   //       //     b.insert(
//   //       //       categories,
//   //       //       CategoriesCompanion.insert(name: 'Important', color: Colors.red),
//   //       //     );

//   //       //     b.insertAll(todoEntries, [
//   //       //       TodoEntriesCompanion.insert(description: 'Check out drift'),
//   //       //       TodoEntriesCompanion.insert(
//   //       //           description: 'Fix session invalidation bug',
//   //       //           category: const Value(1)),
//   //       //       TodoEntriesCompanion.insert(
//   //       //           description: 'Add favorite movies to home page'),
//   //       //     ]);
//   //       //   });
//   //       // }
//   //     },
//   //   );
//   // }

//   Future<List<RentTrx>> getRentTrx() => select(rentTrxDef).get();

//   Future<int> insertRentTrx(RentTrx rentTrx) {
//     return into(rentTrxDef).insert(
//       RentTrxDefCompanion.insert(
//         id: rentTrx.id,
//         title: rentTrx.title,
//       ),
//     );
//   }
// }

import 'package:sqlite3/sqlite3.dart';

class SqliteDb {
  late final Database db;
  static final SqliteDb _instance = SqliteDb._internal();

  factory SqliteDb() {
    return _instance;
  }

  SqliteDb._internal() {
    print('opening Sqlite database ........');
    db = sqlite3.open('assets/rento.sqlite3');
  }

  static SqliteDb get instance => _instance;

  List<Map> select(String table) {
    final select = db.select(' SELECT * FROM $table');
    final result = <Map>[];

    for (var index = 0; index < select.rows.length; index++) {
      final rows = select.rows[index];
      final columns = select.columnNames;

      final item = {};

      for (var g = 0; g <= columns.length - 1; g++) {
        item.putIfAbsent(columns[g], () => rows[g]);
      }

      result.add(item);
    }

    return result;
  }

  rawQuery(String query) {
    return db.execute(query);
  }

  int insert(String table, Map<String, dynamic> data) {
    try {
      final String keys = data.entries.map((e) => e.key).toList().join(', ');
      final List values = data.entries.map((e) => e.value).toList();

      db.execute('''
      INSERT INTO $table ($keys) VALUES (${values.map((e) => "'$e'").join(", ")})
      ''');

      return 0;
    } catch (e) {
      return 1;
    }
  }

  migrate() {
    db.execute('''CREATE TABLE "rent_trx" (
	"id"	TEXT,
	"title"	TEXT,
	"start"	INTEGER,
	"end"	INTEGER,
  "autoRepeat" BOOLEAN,
	"durationMinutes"	INTEGER,
	PRIMARY KEY("id")
)''');

    db.execute('''CREATE TABLE "time_schemes" (
	"id"	TEXT,
	"title"	TEXT,
	"start"	INTEGER,
	"end"	INTEGER,
	"durationMinutes"	INTEGER,
	PRIMARY KEY("id")
)''');
  }
}
