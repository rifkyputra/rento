import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rento/src/select_time/select_time_controller.dart';
import 'package:rento/src/select_time/select_time_service.dart';
import 'package:rento/src/widgets/text/text_widget.dart';

import 'select_time_model.dart';

final SelectTimeService _selectTimeService = SelectTimeService();

final _durationSelectProvider = ChangeNotifierProvider<SelectTimeController>(
  (ref) => SelectTimeController(_selectTimeService,
      timeDuration: TimeDuration(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(hours: 4)),
      )),
);

final _dateSelectProvider = ChangeNotifierProvider<SelectTimeController>(
  (ref) => SelectTimeController(_selectTimeService,
      timeDuration: TimeDuration(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(hours: 4)),
      )),
);

final tabProvider = StateProvider<int>((ref) => 0);

class SelectTimeView extends StatelessWidget {
  const SelectTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Scaffold(
          body: Column(
            children: [
              GestureDetector(
                child: const TextWidget.medium26('Select Time'),
                onTap: () {},
              ),
              const SizedBox(height: 10),
              const TextWidget.light12('hint: tap start date or end date'),
              const SizedBox(height: 15),
              CupertinoSegmentedControl<int>(
                groupValue: ref.read(tabProvider),
                children: const <int, Widget>{
                  0: TextWidget.light16('Duration'),
                  1: TextWidget.light16('Date'),
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
                  child: const TextWidget.light22('Save'),
                  onPressed: () {
                    ref.read(_durationSelectProvider.notifier).updateLocal();
                  },
                ),
              )
            ],
          ),
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
            Column(
              children: [
                const TextWidget.light16('Start'),
                TextWidget.medium16(
                  DateFormat('h:mm, d MMMM y').format(
                    ref.watch(_durationSelectProvider).timeDuration.start,
                  ),
                )
              ],
            ),
            const SizedBox(width: 80),
            Column(
              children: [
                const TextWidget.light16('End'),
                TextWidget.medium16(
                  DateFormat('h:mm, d MMMM y').format(
                    ref.watch(_durationSelectProvider).timeDuration.end,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: HandWheelWidget(
            key: Key(
                '${ref.watch(_durationSelectProvider).recentlyUpdatedWheels}'),
            intialHand: ref.watch(_durationSelectProvider).hands,
            onChanged:
                ref.read(_durationSelectProvider).updateTimeDurationFromWheel,
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

                ref.read(_dateSelectProvider).updateTimeDuration(start: date);
              },
              child: Column(
                children: [
                  const TextWidget.light16('Start'),
                  TextWidget.medium16(
                    DateFormat('d MMMM y').format(
                      ref.watch(_dateSelectProvider).timeDuration.start,
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

                ref.read(_dateSelectProvider).updateTimeDuration(
                      start: ref.read(_dateSelectProvider).timeDuration.start,
                      end: date,
                    );
              },
              child: Column(
                children: [
                  const TextWidget.light16('End'),
                  TextWidget.medium16(
                    DateFormat('d MMMM y').format(
                      ref.watch(_dateSelectProvider).timeDuration.end,
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

      print('from init : $hands');
      print('from init : $value');

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

                      widget.onChanged?.call(index, hands);
                    });
                  },
                  selectionOverlay: const TimePickerDefaultSelectionOverlay(),
                  children: getHolder(hands)
                      .map<Widget>((current) => Center(
                          child: current == value
                              ? TextWidget.xbold22('$current')
                              : TextWidget.medium22('$current')))
                      .toList(),
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: TextWidget.medium28(':'),
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
                      .map((e) => Center(
                          child: e == hands
                              ? TextWidget.xbold22(describeEnum(e))
                              : TextWidget.medium22(describeEnum(e))))
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
