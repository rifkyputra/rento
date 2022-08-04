import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rento/src/components/new_rent_form/new_rent_form_view.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class MainActionPage extends StatelessWidget {
  const MainActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget.size34('Rento', font: poppinsBold),
        centerTitle: true,
      ),
      body: Column(children: [
        Row(
          children: [
            TextButton(
              child: const TextWidget.size16('Rent Something'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NewRentFormView(),
                ));
              },
            ),
            TextButton(
              child: const TextWidget.size16('I Need Something'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Container(),
                ));
              },
            )
          ],
        ),
        const SizedBox(height: 20),
        const TextWidget.size16('list of things that i rented ....'),
        const TextWidget.size16('list of things that i borrowed .....'),
      ]),
    );
  }
}
