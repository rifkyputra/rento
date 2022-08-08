import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rento/src/components/select_time/select_time_controller.dart';
import 'package:rento/src/components/select_time/select_time_service.dart';
import 'package:rento/src/core/platform/mobile.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

import 'select_time_model.dart';

class SelectTimePage extends StatelessWidget {
  const SelectTimePage({super.key});

  static const route = 'select-time';

  @override
  Widget build(BuildContext context) {
    return const SelectTimeView();
  }
}

final tabProvider = StateProvider<int>((ref) => 0);

class SelectTimeView extends StatelessWidget {
  const SelectTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: const TextWidget.size29('Select Time'),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) =>
                  ref.read(durationSelectProvider.notifier).updateTitle(value),
            ),
            const SizedBox(height: 10),
            const TextWidget.size12(
              'hint: tap start date or end date',
              font: interLight,
            ),
            const SizedBox(height: 15),
            CupertinoSegmentedControl<int>(
              groupValue: ref.read(tabProvider),
              children: const <int, Widget>{
                0: TextWidget.size16('Duration', font: interLight),
                1: TextWidget.size16('Date', font: interLight),
              },
              onValueChanged: (selection) {
                ref.read(tabProvider.notifier).update((_) => selection);
              },
            ),
            const SizedBox(height: 15),
            IndexedStack(
              index: ref.watch(tabProvider),
              children: const [
                DurationTab(),
                DateTab(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: const TextWidget.size24(
                  'Save',
                  font: interLight,
                ),
                onPressed: () {
                  ref.read(durationSelectProvider.notifier).updateLocal();
                  Navigator.pop(context);
                },
              ),
            )
          ],
        );
      },
    );
  }
}

class DurationTab extends ConsumerWidget {
  const DurationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );

                if (date == null) return;

                ref
                    .read(durationSelectProvider)
                    .updateTimeDuration(start: date);
              },
              child: Column(
                children: [
                  const TextWidget.size16('Start', font: interLight),
                  TextWidget.size16(
                    DateFormat('h:mm, d MMM y').format(
                      ref.watch(durationSelectProvider).start,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 80),
            Column(
              children: [
                const TextWidget.size16('End', font: interLight),
                TextWidget.size16(
                  DateFormat('h:mm, d MMM y').format(
                    ref.watch(durationSelectProvider).end,
                  ),
                  maxLines: 3,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: HandWheelWidget(
            intialHand: ref.watch(durationSelectProvider).hands,
            onChanged:
                ref.read(durationSelectProvider).updateTimeDurationFromWheel,
          ),
        ),
      ],
    );
  }
}

class DateTab extends ConsumerWidget {
  const DateTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );

                if (date == null) return;

                ref.read(dateSelectProvider).updateTimeDuration(start: date);
              },
              child: Column(
                children: [
                  const TextWidget.size16('Start', font: interLight),
                  TextWidget.size16(
                    DateFormat('d MMMM y').format(
                      ref.watch(dateSelectProvider).start,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 80),
            GestureDetector(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );

                if (date == null) return;

                ref.read(dateSelectProvider).updateTimeDuration(
                      start: ref.read(dateSelectProvider).start,
                      end: date,
                    );
              },
              child: Column(
                children: [
                  const TextWidget.size16('End', font: interLight),
                  TextWidget.size16(
                    DateFormat('d MMM y').format(
                      ref.watch(dateSelectProvider).end,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HandWheelWidget extends StatefulWidget {
  const HandWheelWidget({
    Key? key,
    this.onChanged,
    this.width,
    this.intialHand,
  }) : super(key: key);

  final double? width;

  final Hands? intialHand;

  final void Function(int, Hands)? onChanged;

  @override
  State<HandWheelWidget> createState() => _HandWheelWidgetState();
}

class _HandWheelWidgetState extends State<HandWheelWidget> {
  late int value;
  late int valueIndex;
  late Hands hands;
  late FixedExtentScrollController _handController;
  late FixedExtentScrollController _valueController;

  @override
  void initState() {
    super.initState();

    setState(() {
      hands = widget.intialHand ?? Hands.minute;
      valueIndex = 0;
      value = _durationVal[hands][valueIndex];

      _handController = FixedExtentScrollController(initialItem: hands.index);
      _valueController = FixedExtentScrollController(initialItem: 0);
    });
  }

  @override
  void dispose() {
    _handController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: const CupertinoThemeData(),
      child: SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: SizedBox(
                height: 200,
                child: CupertinoPicker(
                  key: widget.key,
                  scrollController: _valueController,
                  looping: true,
                  itemExtent: 50,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      valueIndex = index;
                      value = _durationVal[hands][valueIndex];

                      widget.onChanged?.call(value, hands);
                    });
                  },
                  selectionOverlay: const TimePickerDefaultSelectionOverlay(),
                  children: getHolder(hands)
                      .map<Widget>(
                        (current) => Center(
                          child: current == value
                              ? TextWidget.size24(
                                  '$current',
                                  font: interExtraBold,
                                )
                              : TextWidget.size24(
                                  '$current',
                                ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: TextWidget.size20(':'),
            ),
            Flexible(
              flex: 4,
              child: SizedBox(
                height: 200,
                child: CupertinoPicker(
                  scrollController: _handController,
                  looping: true,
                  itemExtent: 50,
                  offAxisFraction: .10,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      hands = Hands.values[index];

                      value = _durationVal[hands][valueIndex];

                      widget.onChanged?.call(value, hands);
                    });
                  },
                  selectionOverlay: const TimePickerDefaultSelectionOverlay(),
                  children: Hands.values
                      .map(
                        (e) => Center(
                          child: e == hands
                              ? TextWidget.size24(
                                  describeEnum(e),
                                  font: interExtraBold,
                                )
                              : TextWidget.size24(describeEnum(e)),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getMinutesString(int value) =>
      value < 10 && value >= 0 ? '0$value' : '$value';

  List getHolder(Hands hand) {
    return _durationVal[hand];
  }

  final Map _durationVal = <Hands, List<int>>{
    Hands.minute: const [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60],
    Hands.hour: List.generate(24, (i) => i + 1),
    Hands.week: List.generate(10, (i) => i + 1),
    Hands.month: List.generate(12, (i) => i + 1),
    Hands.year: List.generate(4, (i) => i + 1),
    Hands.days: List.generate(31, (i) => i + 1),
  };
}

class TimePickerDefaultSelectionOverlay extends StatelessWidget {
  const TimePickerDefaultSelectionOverlay({
    Key? key,
    this.background = CupertinoColors.tertiarySystemFill,
    this.marginLeft = 0,
    this.marginRight = 0,
  }) : super(key: key);

  final double marginLeft;
  final double marginRight;

  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: marginLeft,
        right: marginRight,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
