import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/components/select_time/select_time_view.dart';
import 'package:rento/src/core/platform/mobile.dart';
import 'package:rento/src/core/widgets/buttons/primary_button.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class NewRentFormPage extends StatelessWidget {
  const NewRentFormPage({Key? key}) : super(key: key);

  static const String route = 'new';

  @override
  Widget build(BuildContext context) {
    return const NewRentFormView();
  }
}

class NewRentFormView extends StatelessWidget {
  const NewRentFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            TextWidget.size20('Add Rent', font: interBold),
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
  const TitleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        child: TextField(
          onChanged: (value) =>
              ref.watch(rentFormProvider.notifier).editTitle(value),
        ),
      );
    });
  }
}

class DateField extends ConsumerWidget {
  const DateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        // context.go(SelectTimePage.route);
        showModalBottomSheet(
          context: context,
          enableDrag: false,
          isScrollControlled: true,
          builder: (context) => const DateBottomSheet(),
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
  const PriceField({Key? key}) : super(key: key);

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
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      onTap: () {
        ref.read(rentFormProvider.notifier).saveForm();
      },
      text: 'Submit',
    );
  }
}

class DraggablePill extends ConsumerWidget {
  const DraggablePill({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 100,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class DateBottomSheet extends StatefulWidget {
  const DateBottomSheet({Key? key}) : super(key: key);

  @override
  State<DateBottomSheet> createState() => DateBottomSheetState();
}

class DateBottomSheetState extends State<DateBottomSheet> {
  double? height;
  GlobalKey key = GlobalKey();
  late DraggableScrollableController controller;

  RenderBox? get renderBox => key.currentContext?.findRenderObject() == null
      ? null
      : key.currentContext?.findRenderObject() as RenderBox;

  double get size =>
      (renderBox!.size.height / MediaQuery.of(context).size.height).clamp(0, 1);

  @override
  void initState() {
    super.initState();
    controller = DraggableScrollableController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        height = size + 0.01;
      });
    });
  }

  double get initialHeight => height ?? 0.4;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      return DraggableScrollableSheet(
        controller: controller,
        expand: false,
        snapSizes: const [0.8, 0.9],
        snap: true,
        maxChildSize: 1,
        initialChildSize: initialHeight,
        builder: (_, scroll) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SingleChildScrollView(
              controller: scroll,
              child: Column(
                key: key,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  DraggablePill(),
                  SelectTimeView(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
