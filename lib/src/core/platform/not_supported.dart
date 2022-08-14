import 'package:flutter/material.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

/// a nonsense approach for handling not supported platform in app.dart
class NotSupportedPlatform extends StatelessWidget {
  const NotSupportedPlatform({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SizedBox(child:Center(child: TextWidget.size40('Not Supported Platform'),),)
    );
  }
}