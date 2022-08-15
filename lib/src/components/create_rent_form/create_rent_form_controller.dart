import 'package:flutter/foundation.dart';
import 'package:rento/src/components/create_rent_form/create_rent_form_model.dart';

import 'create_rent_form_service.dart';

class CreateRentFormController extends ChangeNotifier {
  CreateRentFormController({
    required this.formModel,
    required this.service,
  });

  final NewRentFormModel formModel;
  final CreateRentFormService service;

  editTitle(String title) {
    formModel.editTitleField(title);

    notifyListeners();
  }

  saveForm() async {
    await service.insertForm(formModel);
    notifyListeners();
  }

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
