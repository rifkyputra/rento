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
      return TextButton.icon(
        onPressed: onTap,
        key: key,
        style: style,
        icon: icon!,
        label: label!,
      );
    }

    return TextButton(
      onPressed: onTap,
      key: key,
      statesController: MaterialStatesController(),
      style: style,
      child: textWidget,
    );
  }

  TextWidget get textWidget =>
      TextWidget.size14(text, color: Colors.grey.shade800);

  ButtonStyle get style => ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 26, vertical: 4),
      ),
      textStyle: MaterialStateProperty.all(textWidget.style),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.grey.shade300));
}
