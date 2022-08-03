import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/components/new_rent_form/new_rent_form_controller.dart';
import 'package:rento/src/components/new_rent_form/new_rent_form_model.dart';
import 'package:rento/src/components/new_rent_form/new_rent_form_service.dart';
import 'package:rento/src/components/select_time/select_time_view.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

final rentFormProvider = ChangeNotifierProvider<NewRentFormController>(
  (ref) => NewRentFormController(
    formModel: NewRentFormModel(),
    service: NewRentFormService(),
  ),
);

class NewRentFormView extends StatelessWidget {
  const NewRentFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            TextWidget.bold18('Add Rent'),
            SizedBox(height: 20),
            TitleField(),
            SizedBox(height: 20),
            DateField(),
            SizedBox(height: 20),
            PriceField(),
            SizedBox(height: 20),
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class TitleField extends ConsumerWidget {
  const TitleField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: (value) {
        ref.watch(rentFormProvider.notifier).editTitle(value);
      },
    );
  }
}

class DateField extends ConsumerWidget {
  const DateField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(rentFormProvider).formModel.startField == null) {
      return const TextWidget.medium16('Add Time and Duration');
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SelectTimeView(),
        ));
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: TextWidget.medium16(
                ref.watch(rentFormProvider).formModel.startField.toString()),
          ),
          Flexible(
            child: TextWidget.medium16(ref
                .watch(rentFormProvider)
                .formModel
                .durationMinutesField
                .toString()),
          ),
        ],
      ),
    );
  }
}

class PriceField extends ConsumerWidget {
  const PriceField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const TextWidget.bold12('Rp'),
        TextWidget.bold12(
            ref.watch(rentFormProvider).formModel.valueField.toString()),
      ],
    );
  }
}

class SubmitButton extends ConsumerWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        print(ref.read(rentFormProvider.notifier).modelToMap);
      },
      child: const TextWidget.medium12('Submit'),
    );
  }
}
