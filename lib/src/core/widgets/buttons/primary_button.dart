import 'package:flutter/material.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
  })  : icon = null,
        label = null,
        super(key: key);

  const PrimaryButton.icon({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final void Function() onTap;
  final String text;

  final Widget? icon;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    if (icon != null && label != null) {
      TextButton.icon(onPressed: onTap, icon: icon!, label: label!);
    }

    return TextButton(
      onPressed: onTap,
      key: key,
      statesController: MaterialStatesController(),
      style: style,
      child: textWidget,
    );
  }

  TextWidget get textWidget => TextWidget.size16(text);

  ButtonStyle get style => ButtonStyle(
        textStyle: MaterialStateProperty.all(textWidget.style),
      );
}
