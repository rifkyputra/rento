import 'package:rento/src/components/create_rent_form/create_rent_form_model.dart';
import 'package:rento/src/shared/models/models.dart';
import 'package:uuid/uuid.dart';
import 'package:rento/src/core/core.dart';

class CreateRentFormService {
  CreateRentFormService({
    this.table,
    this.sqliteDatabase,
  });

  final dynamic table;
  final SqliteDb? sqliteDatabase;

  Future<int> insertForm(NewRentFormModel formModel) async {
    try {
      final query = sqliteDatabase!.insert(
          'rent_trx',
          RentTrx(
            id: const Uuid().v4(),
            title: formModel.titleField ?? '',
            durationMinutes: formModel.durationMinutesField ?? 10,
            // start: formModel.startField?.toEpochSecond,
            // end: formModel.endField?.toEpochSecond,
            // currency: formModel.currencyField,
            // autoRepeat: formModel.autoRepeatField ?? false,
            // value: formModel.valueField,
          ).toMap());

      print(query);

      return query;
    } catch (e) {
      print(e);
    }

    return -1;
  }
}
