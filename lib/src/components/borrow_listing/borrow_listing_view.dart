import 'package:flutter/material.dart';
import 'package:rento/src/core/driver/drift_driver.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class BorrowListingPage extends StatelessWidget {
  const BorrowListingPage({Key? key}) : super(key: key);

  static const String route = 'listing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BorrowListingView()),
    );
  }
}

class BorrowListingView extends StatelessWidget {
  BorrowListingView({Key? key}) : super(key: key);

  final list = [
    RentTrx(
      id: '3dsf',
      title: 'RTX 3060',
      autoRepeat: false,
    ),
    RentTrx(
      id: '3dsf',
      title: 'Rumah Depok',
      autoRepeat: false,
    ),
    RentTrx(
      id: '3dsf',
      title: 'Porsche',
      autoRepeat: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Container(
              color: Colors.grey.shade400,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    anchorPoint: const Offset(-40, 80),
                    builder: (c) {
                      return Dialog(
                        insetPadding: EdgeInsets.zero,
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TextField(
                              autofocus: true,
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: const [
                                    HistoryItem(title: 'title field'),
                                    HistoryItem(title: 'Shrimp Wrap'),
                                    HistoryItem(title: 'Allyx'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.search),
                    ),
                    TextWidget.size14(
                      'Search Something..',
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Wrap(
            children: List.generate(
              list.length,
              (index) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListingCard(title: list[index].title)),
            ),
          ),
        ],
      ),
    );
  }
}

class ListingCard extends StatelessWidget {
  const ListingCard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .35,
          maxHeight: MediaQuery.of(context).size.width * .5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 80,
                  width: double.maxFinite,
                  child: Image.network(
                    'https://picsum.photos/100/80',
                    fit: BoxFit.cover,
                  ),
                ),
                TextWidget.size16(title),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Wrap(
                    children: const [
                      Chip(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Colors.amber,
                        label: TextWidget.size14('#Tags1'),
                      ),
                    ],
                  ),
                  const TextWidget.size14('Duration : 4 Hours'),
                  const TextWidget.size14('Anthony Adi Wijaya'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        Icon(
          Icons.history,
          size: (IconTheme.of(context).size ?? 20) * .8,
          color: Colors.grey,
        ),
        const SizedBox(width: 7),
        TextWidget.size16(title)
      ]),
    );
  }
}
