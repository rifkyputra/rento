import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rento/src/components/borrow_listing/borrow_listing_view.dart';
import 'package:rento/src/components/new_rent_form/new_rent_form_view.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          TextButton(
            child: const TextWidget.size16('Rent Something'),
            onPressed: () {
              context.go('/${NewRentFormPage.route}');
            },
          ),
          TextButton(
            child: const TextWidget.size16('I Need Something'),
            onPressed: () {
              context.go('/${BorrowListingPage.route}');
            },
          )
        ],
      ),
      const SizedBox(height: 20),
    ]);
  }
}
