import 'package:rento/src/components/new_rent_form/new_rent_form_model.dart';
import 'package:uuid/uuid.dart';
import 'package:rento/src/core/core.dart';

class NewRentFormService {
  NewRentFormService({
    this.table,
    this.sqliteDatabase,
  });

  final dynamic table;
  final SqliteDatabase? sqliteDatabase;

  Future<int> insertForm(NewRentFormModel formModel) async {
    try {
      final query = await sqliteDatabase!.insertRentTrx(RentTrx(
        id: const Uuid().v4(),
        title: formModel.titleField ?? '',
        durationMinutes: formModel.durationMinutesField,
        start: formModel.startField?.toEpochSecond,
        end: formModel.endField?.toEpochSecond,
        currency: formModel.currencyField,
        autoRepeat: formModel.autoRepeatField ?? false,
        value: formModel.valueField,
      ));

      return query;
    } catch (_) {}

    return -1;
  }
}
