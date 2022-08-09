import 'package:flutter/material.dart';
import 'package:rento/src/core/driver/drift_driver.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class BorrowListingPage extends StatelessWidget {
  const BorrowListingPage({super.key});

  static const String route = 'listing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BorrowListingView()),
    );
  }
}

class BorrowListingView extends StatelessWidget {
  BorrowListingView({super.key});

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
                onTap: () {},
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
              (index) => ListingCard(title: list[index].title),
            ),
          ),
        ],
      ),
    );
  }
}

class ListingCard extends StatelessWidget {
  const ListingCard({super.key, required this.title});

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
              padding: EdgeInsets.all(6),
              child: Column(
                children: [
                  Wrap(
                    children: [
                      Chip(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Colors.amber,
                        label: TextWidget.size14('#Tags1'),
                      ),
                    ],
                  ),
                  TextWidget.size14('Duration : 4 Hours'),
                  TextWidget.size14('Anthony Adi Wijaya'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
