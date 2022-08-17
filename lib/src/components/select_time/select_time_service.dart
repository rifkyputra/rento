import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rento/main.dart';
import 'package:rento/src/core/core.dart';
import 'package:rento/src/shared/models/models.dart';
import 'package:uuid/uuid.dart';

import 'select_time_model.dart';

class SelectTimeService {
  const SelectTimeService(this.database);

  final SqliteDb database;

  FirebaseFirestore get firestore => firebaseFirestore;

  static const table = 'time_schemes';

  saveLocal(TimeDuration timeDuration, String title) async {
    database.insert(
      table,
      TimeScheme(
        id: const Uuid().v4(),
        name: title,
        durationMinutes: timeDuration.duration.inMinutes,
        start: timeDuration.start.toEpochSecond,
        end: timeDuration.end.toEpochSecond,
      ).toMap(),
    );
  }

  submitData(TimeDuration timeDuration, String title) async {
    firestore
        .collection('root')
        .doc('ada')
        .collection('timeScheme')
        .add(timeDuration.toJson().putIfAbsent('name', () => title));
  }

  getLocal() {
    return database.select(table);
  }

  // Future<int> deleteLocal(TimeScheme timeScheme) async {
  //   var query = (database.delete(database.timeDurationDef)
  //     ..where((t) => t.id.equals(timeScheme.id)));

  //   return query.go();
  // }

  retrieveData() {}
}
