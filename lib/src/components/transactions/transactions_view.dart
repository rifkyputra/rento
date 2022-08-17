import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/core/platform/mobile.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';
import 'package:sizer/sizer.dart';

class TransactionsView extends ConsumerStatefulWidget {
  const TransactionsView({Key? key}) : super(key: key);

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
    ref.read(transactionsProvider.notifier).getAllTransactions();

    // ref.read(transactionsProvider).
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextWidget.size24('Transactions'),
              Sizer(builder: (_, orientation, device) {
                if (device == DeviceType.mobile) {
                  return const ListTransactionNarrow();
                }

                return const ListTransactionWide();
              })
            ],
          ),
        ),
      );
    });
  }
}

class ListTransactionWide extends ConsumerWidget {
  const ListTransactionWide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 150,
          ),
          itemCount: ref.watch(transactionsProvider).length,
          itemBuilder: (context, i) {
            return TransactionCard(
              duration: '2 months',
              status: 'Rent',
              title: ref.watch(transactionsProvider)[i].title,
            );
          },
        ),
      ),
    );
  }
}

class ListTransactionNarrow extends ConsumerWidget {
  const ListTransactionNarrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: ref.watch(transactionsProvider).length,
      itemBuilder: (context, i) {
        return TransactionCard(
          duration: '2 months',
          status: 'Rent',
          title: ref.watch(transactionsProvider)[i].title,
        );
      },
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard(
      {Key? key,
      required this.title,
      required this.duration,
      required this.status})
      : super(key: key);

  final String title;
  final String duration;
  final String status;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 120),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.s,
              children: [
                Image.network(
                  'https://picsum.photos/seed/picsum/200/150',
                  width: 200,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget.size14(
                          status,
                          font: interLight,
                        ),
                        TextWidget.size24(
                          title,
                          font: poppinsBold,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextWidget.size14(duration),
                  ),
                ),
                const SizedBox(width: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
