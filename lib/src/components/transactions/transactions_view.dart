import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/core/platform/mobile.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class TransactionsView extends ConsumerStatefulWidget {
  const TransactionsView({super.key});

  @override
  ConsumerState<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends ConsumerState<TransactionsView> {
  @override
  void initState() {
    super.initState();

    ref.read(transactionsProvider.notifier).getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    // ref.read(transactionsProvider).
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
        body: ListView(
          children: [
            const TextWidget.size24('Transactions'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: ref.watch(transactionsProvider).length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: TextWidget.size14(
                      ref.watch(transactionsProvider)[i].title),
                );
              },
            )
          ],
        ),
      );
    });
  }
}
