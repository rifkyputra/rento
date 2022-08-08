import 'dart:io';

import 'package:hive/hive.dart';
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

  insertForm(NewRentFormModel formModel) => Platform.isAndroid || Platform.isIOS
      ? _insertHive(formModel)
      : _insertSqlite(formModel);

  _insertHive(NewRentFormModel formModel) {
    Hive.box(table).put(const Uuid().v4(), formModel);
  }

  _insertSqlite(NewRentFormModel formModel) {
    return sqliteDatabase?.into(sqliteDatabase!.rentTrxDef).insert(RentTrx(
          id: const Uuid().v4(),
          title: formModel.titleField ?? '',
          durationMinutes: formModel.durationMinutesField,
          start: formModel.startField?.toEpochSecond,
          end: formModel.endField?.toEpochSecond,
          currency: formModel.currencyField,
          autoRepeat: formModel.autoRepeatField ?? false,
          value: formModel.valueField,
        ));
  }
}
