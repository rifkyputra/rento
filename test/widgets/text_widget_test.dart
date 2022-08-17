import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rento/src/shared/widgets/text/text_widget.dart';

void main() {
  group('Default Widget', () {
    testWidgets(
      'String Hello find one text',
      (widgetTester) async {
        await widgetTester.pumpWidget(wrapWithApp(TextWidget('Hello')));

        expect(find.text('Hello'), findsOneWidget);
        expect(find.widgetWithText(TextWidget, 'Hello'), findsOneWidget);
      },
    );

    testWidgets(
      'Long string find one text',
      (widgetTester) async {
        final text =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliam' *
                100;

        await widgetTester.pumpWidget(
          wrapWithApp(TextWidget(
            text,
          )),
        );

        expect(find.text(text), findsOneWidget);
        expect(find.widgetWithText(TextWidget, text), findsOneWidget);
      },
    );

    testWidgets(
      'Long string find one text elipsis, widget has max width',
      (widgetTester) async {
        final text =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliam' *
                100;

        await widgetTester.pumpWidget(
          wrapWithApp(
            SizedBox(
              width: 40,
              child: TextWidget(
                text,
              ),
            ),
          ),
        );

        expect(find.text(text), findsOneWidget);
        expect(find.widgetWithText(TextWidget, text), findsOneWidget);
        expect(
            find.byWidgetPredicate((widget) =>
                widget is Text &&
                widget.maxLines == 1 &&
                widget.overflow == TextOverflow.ellipsis),
            findsOneWidget);
        expect(widgetTester.takeException(), null);
      },
    );
  });

  group('TextWidget size xx', () {
    testWidgets(
      'Size12 default font',
      (widgetTester) async {
        await widgetTester
            .pumpWidget(wrapWithApp(const TextWidget.size12('Hello')));

        expect(
            find.byWidgetPredicate(
                (widget) => widget is Text && widget.style!.fontSize == 12),
            findsOneWidget);
      },
    );

    testWidgets(
      'Size12 poppins font',
      (widgetTester) async {
        const widget = TextWidget.size12(
          'Hello',
          font: poppinsMedium,
        );
        await widgetTester.pumpWidget(wrapWithApp(widget));

        expect(
            find.byWidgetPredicate((widget) =>
                widget is Text &&
                widget.style!.fontSize == 12 &&
                widget.style!.fontFamily == 'Poppins_500'),
            findsOneWidget);
      },
    );
  });
}

wrapWithApp(Widget widget) {
  return MaterialApp(
    home: Scaffold(
      body: widget,
    ),
  );
}
