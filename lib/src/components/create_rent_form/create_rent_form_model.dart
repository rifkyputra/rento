import 'package:rento/src/core/core.dart';
import 'package:rento/src/shared/models/models.dart';

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

  // restored draft Trx
  RentTrx? savedRentTrx;

  Future<bool> editTitleField(String title) async {
    titleField = title;
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

  restoreRentTrxToField(RentTrx rentTrx) {
    savedRentTrx = rentTrx;

    titleField = rentTrx.title;

    if (rentTrx.start != null) {
      startField = DateTimeXt.fromSecondEpoch(rentTrx.start!);
    }

    if (rentTrx.end != null) {
      endField = DateTimeXt.fromSecondEpoch(rentTrx.end!);
    }

    if (rentTrx.durationMinutes != null) {
      durationMinutesField = rentTrx.durationMinutes;
    }
  }
}

enum FormStatus {
  edit,
  create,
}
