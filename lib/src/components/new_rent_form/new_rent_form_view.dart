import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rento/src/components/select_time/select_time_view.dart';
import 'package:rento/src/core/platform/mobile.dart';
import 'package:rento/src/core/widgets/buttons/primary_button.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class NewRentFormPage extends StatelessWidget {
  const NewRentFormPage({super.key});

  static const String route = 'new';

  @override
  Widget build(BuildContext context) {
    return const NewRentFormView();
  }
}

class NewRentFormView extends StatelessWidget {
  const NewRentFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            TextWidget.size20(
              'Add Rent',
              font: interBold,
            ),
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
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        child: TextField(
          onChanged: (value) {
            ref.watch(rentFormProvider.notifier).editTitle(value);
          },
        ),
      );
    });
  }
}

class DateField extends ConsumerWidget {
  const DateField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        // context.go(SelectTimePage.route);
        showModalBottomSheet(
          context: context,
          builder: ((context) => SelectTimeView()),
        );
      },
      child: ref.watch(rentFormProvider).formModel.startField == null
          ? const TextWidget.size16('Add Time and Duration')
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextWidget.size16(ref
                      .watch(rentFormProvider)
                      .formModel
                      .startField
                      .toString()),
                ),
                Flexible(
                  child: TextWidget.size16(ref
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
        const TextWidget.size12(
          'Rp',
          font: interBold,
        ),
        TextWidget.size12(
          ref.watch(rentFormProvider).formModel.valueField.toString(),
          font: interBold,
        ),
      ],
    );
  }
}

class SubmitButton extends ConsumerWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      onTap: () {
        ref.read(rentFormProvider.notifier).saveForm();

        print(ref.read(rentFormProvider.notifier).modelToMap);
      },
      text: 'Submit',
    );
  }
}
