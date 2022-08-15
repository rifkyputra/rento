import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class ScaffoldWithClose extends StatelessWidget {
  const ScaffoldWithClose({Key? key, required this.body, this.title})
      : super(key: key);

  final String? title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: title == null ? null : TextWidget.size20(title!),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: body,
    );
  }
}
