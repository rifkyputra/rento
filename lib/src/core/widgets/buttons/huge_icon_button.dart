import 'package:flutter/material.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class HugeIconButton extends StatelessWidget {
  const HugeIconButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      key: key,
      statesController: MaterialStatesController(),
      style: style,
      child: child,
    );
  }

  ButtonStyle get style => ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      ),
      textStyle: MaterialStateProperty.all(textStyle(14, interMedium)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.grey.shade300));
}
