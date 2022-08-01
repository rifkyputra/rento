import 'package:rento/src/core/drift_def/definitions.dart';

class NewRentFormModel {
  NewRentFormModel({
    this.formStatus = FormStatus.create,
    String? titleField,
    DateTime? startField,
    DateTime? endField,
    int? durationMinutesField,
    String? currencyField,
    bool? autoRepeatField,
    int? valueField,
  }) {
    titleField = titleField ?? this.titleField;
    startField = startField ?? this.startField;
    endField = endField ?? this.endField;
    durationMinutesField = durationMinutesField ?? this.durationMinutesField;
    currencyField = currencyField ?? this.currencyField;
    autoRepeatField = autoRepeatField ?? this.autoRepeatField;
    valueField = valueField ?? this.valueField;
  }

  String? titleField;
  DateTime? startField;
  DateTime? endField;
  int? durationMinutesField;
  String? currencyField;
  bool? autoRepeatField;
  int? valueField;
  FormStatus formStatus;

  RentTrxDef? savedRentTrx;

  Future<bool> editTitleField(String title) async {
    return false;
  }

  Future<bool> editTime({
    required DateTime start,
    DateTime? end,
    Duration? duration,
  }) async {
    return false;
  }

  Future<bool> editValueField({String? currency, int? value}) async {
    return false;
  }

  restoreRentTrxToField(RentTrxDef rentTrx) {}
}

enum FormStatus {
  edit,
  create,
}
