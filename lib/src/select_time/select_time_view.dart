import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rento/main.dart';
import 'package:rento/src/select_time/select_time_controller.dart';
import 'package:rento/src/widgets/text/text_widget.dart';

class SelectTimeView extends StatelessWidget {
  const SelectTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
        body: Column(
          // crossAxisAlignment: Cro,
          children: [
            GestureDetector(
              child: const TextWidget.medium26('Select Time'),
              onTap: () {
                print('tttttttt');
              },
            ),
            const SizedBox(height: 10),
            const TextWidget.light12('hint: tap start date or end date'),
            const SizedBox(height: 15),
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
                        .read(selectTimeProvider)
                        .updateTimeDuration(start: date);
                  },
                  child: Column(
                    children: [
                      const TextWidget.light16('Start'),
                      TextWidget.medium16(
                        DateFormat('h:mm, d MMMM y').format(
                          ref.watch(selectTimeProvider).timeDuration.start,
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

                    ref.read(selectTimeProvider).updateTimeDuration(
                          start:
                              ref.read(selectTimeProvider).timeDuration.start,
                          end: date,
                        );
                  },
                  child: Column(
                    children: [
                      const TextWidget.light16('End'),
                      TextWidget.medium16(
                        DateFormat('h:mm, d MMMM y').format(
                          ref.watch(selectTimeProvider).timeDuration.end,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: HandWheelWidget(
                initialValue: 10,
                intialHand: Hands.hour,
                onChanged: ref.read(selectTimeProvider).updateHands,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class HandWheelWidget extends StatefulWidget {
  const HandWheelWidget({
    Key? key,
    this.onChanged,
    this.width,
    this.initialValue,
    this.intialHand,
  }) : super(key: key);

  final double? width;

  final int? initialValue;
  final Hands? intialHand;

  final void Function(int, Hands)? onChanged;

  @override
  State<HandWheelWidget> createState() => _HandWheelWidgetState();
}

class _HandWheelWidgetState extends State<HandWheelWidget> {
  late int value;
  late Hands hands;
  late FixedExtentScrollController _handController;
  late FixedExtentScrollController _valueController;

  List minutes = [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60];
  @override
  void initState() {
    super.initState();

    setState(() {
      hands = widget.intialHand ?? Hands.minute;
      value = widget.initialValue ?? 10;

      _handController = FixedExtentScrollController(initialItem: hands.index);
      _valueController = FixedExtentScrollController(initialItem: value);
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
      data: CupertinoThemeData(),
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
                  scrollController: _handController,
                  looping: true,
                  itemExtent: 50,
                  onSelectedItemChanged: (int value) {
                    setState(() {
                      value = getHolder(hands)[value];
                      widget.onChanged?.call(value, hands);
                    });
                  },
                  selectionOverlay:
                      const IsafeTimePickerDefaultSelectionOverlay(),
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
                  scrollController: _valueController,
                  looping: true,
                  itemExtent: 50,
                  offAxisFraction: .10,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      hands = Hands.values[index];
                      widget.onChanged?.call(value, hands);
                    });
                  },
                  selectionOverlay:
                      const IsafeTimePickerDefaultSelectionOverlay(),
                  children: List.generate(
                    Hands.values.length,
                    (index) => Center(
                        child: index == hands.index
                            ? TextWidget.xbold22(
                                describeEnum(Hands.values[index]))
                            : TextWidget.medium22(
                                describeEnum(Hands.values[index]))),
                  ),
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
    switch (hands) {
      case Hands.minute:
        return minutes;
      case Hands.hour:
        return List.generate(24, (i) => i + 1);
      case Hands.week:
        return List.generate(10, (i) => i + 1);
      case Hands.month:
        return List.generate(12, (i) => i + 1);
      case Hands.year:
        return List.generate(4, (i) => i + 1);
      case Hands.days:
        return List.generate(31, (i) => i + 1);
    }
  }
}

class IsafeTimePickerDefaultSelectionOverlay extends StatelessWidget {
  const IsafeTimePickerDefaultSelectionOverlay({
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
