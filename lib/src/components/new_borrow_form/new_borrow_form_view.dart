import 'package:flutter/material.dart';
import 'package:rento/src/shared/widgets/text/text_widget.dart';

class NewBorrowFormPage extends StatelessWidget {
  const NewBorrowFormPage({Key? key}): super(key: key);

  static const String route = 'new-borrow';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
          child: TextWidget.size34(
            'Borrow Something',
            font: poppinsBold,
          ),
        )
      ],
    );
  }
}
