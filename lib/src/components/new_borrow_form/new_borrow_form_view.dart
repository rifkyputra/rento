import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class NewBorrowFormPage extends StatelessWidget {
  const NewBorrowFormPage({super.key});

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
