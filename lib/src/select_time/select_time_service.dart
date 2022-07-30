import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rento/main.dart';
import 'package:rento/src/drift_def/time_duration/time_duration_def.dart';
import 'package:rento/src/driver/drift_driver.dart';
import 'package:uuid/uuid.dart';

import '../abstract/abstract.dart';
import 'select_time_model.dart';
import 'package:rento/src/extensions/datetime_xt.dart';

class SelectTimeService implements SaveSubmit, GetRetrieve {
  SqliteDatabase get database => sqliteDatabase;
  FirebaseFirestore get firestore => firebaseFirestore;

  static const table = 'TimeScheme';

  @override
  saveLocal(TimeDuration timeDuration) async {
    final ins = await database.into(database.timeDurationDef).insert(
          TimeScheme(
            id: const Uuid().v4(),
            name: 'Paket Mantap',
            durationMinutes: timeDuration.duration.inMinutes,
            start: timeDuration.start.toEpochSecond(),
            epoch: timeDuration.end.toEpochSecond(),
          ),
        );

    print('-----> $ins');
  }

  @override
  submitData(TimeDuration timeDuration) async {
    firestore
        .collection('root')
        .doc('ada')
        .collection('timeScheme')
        .add(timeDuration.toJson());
  }

  @override
  getLocal() {
    return database.select(database.timeDurationDef).get();
  }

  @override
  retrieveData() {}
}
