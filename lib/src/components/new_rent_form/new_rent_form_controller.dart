import 'package:flutter/foundation.dart';
import 'package:rento/src/components/new_rent_form/new_rent_form_model.dart';

import 'new_rent_form_service.dart';

class NewRentFormController extends ChangeNotifier {
  NewRentFormController({
    required this.formModel,
    required this.service,
  });

  final NewRentFormModel formModel;
  final NewRentFormService service;

  editTitle(String title) {
    formModel.editTitleField(title);

    notifyListeners();
  }

  saveForm() {}

  Map get modelToMap {
    return {
      'title': formModel.titleField,
      'startField': formModel.startField,
      'endField': formModel.endField,
      'durationMinutesField': formModel.durationMinutesField,
      'currencyField': formModel.currencyField,
      'autoRepeatField': formModel.autoRepeatField,
      'valueField': formModel.valueField,
    }..removeWhere((_, value) => value == null);
  }
}
