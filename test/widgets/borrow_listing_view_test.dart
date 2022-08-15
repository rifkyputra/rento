import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rento/src/components/borrow_listing/borrow_listing_view.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });
  Widget makeTestableWidget() => MaterialApp(home: Image.network(''));
  group('test widget', () {
    testWidgets('toast', (tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(MaterialApp(
          builder: BotToastInit(), //1. call BotToastInit

          navigatorObservers: [BotToastNavigatorObserver()],
          home: BorrowListingPage(),
        )),
      );

      await expectLater(find.byType(BorrowListingView), findsOneWidget);

      await tester.pumpAndSettle(Duration(seconds: 5));
    });
  });
}
