import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rento/src/shared/widgets/text/text_widget.dart';
import 'package:rento/src/shared/widgets/toast/top_toast.dart';

class ScaffoldWithBack extends StatelessWidget {
  const ScaffoldWithBack({Key? key, required this.body, this.title})
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: body,
    );
  }
}
