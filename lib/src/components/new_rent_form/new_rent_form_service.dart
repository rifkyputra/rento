import 'package:rento/main.dart';
import 'package:rento/src/components/new_rent_form/new_rent_form_model.dart';
import 'package:uuid/uuid.dart';
import 'package:rento/src/core/core.dart';

class NewRentFormService {
  SqliteDatabase get db => sqliteDatabase;

  insertForm(NewRentFormModel formModel) {
    return db.into(db.rentTrxDef).insert(
          RentTrx(
            id: const Uuid().v4(),
            title: formModel.titleField ?? '',
            durationMinutes: formModel.durationMinutesField,
            start: formModel.startField?.toEpochSecond,
            end: formModel.endField?.toEpochSecond,
            currency: formModel.currencyField,
            autoRepeat: formModel.autoRepeatField ?? false,
            value: formModel.valueField,
          ),
        );
  }
}
