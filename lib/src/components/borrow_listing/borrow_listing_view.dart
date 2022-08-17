import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:rento/src/core/driver/drift_driver.dart';
import 'package:rento/src/shared/models/models.dart';
import 'package:rento/src/shared/widgets/scaffold/scaffold_with_back.dart';
import 'package:rento/src/shared/widgets/text/text_widget.dart';

class BorrowListingPage extends StatelessWidget {
  const BorrowListingPage({Key? key}) : super(key: key);

  static const String route = 'listing';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBack(
      body: SafeArea(child: BorrowListingView()),
    );
  }
}

class BorrowListingView extends StatefulWidget {
  BorrowListingView({Key? key}) : super(key: key);

  @override
  State<BorrowListingView> createState() => _BorrowListingViewState();
}

class _BorrowListingViewState extends State<BorrowListingView> {
  final list = [
    RentTrx(
      id: '3dsf',
      title: 'RTX 3060',
      autoRepeat: false,
      durationMinutes: 10,
    ),
    RentTrx(
      id: '3dsf',
      title: 'Rumah Depok',
      autoRepeat: false,
      durationMinutes: 10,
    ),
    RentTrx(
      id: '3dsf',
      title: 'Porsche',
      autoRepeat: false,
      durationMinutes: 10,
    ),
  ];

  CancelFunc showToast(String text, [BuildContext? context]) =>
      BotToast.showAttachedWidget(
        preferDirection: PreferDirection.topCenter,
        attachedBuilder: (CancelFunc i) => Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              i();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black45,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: TextWidget.size12(text),
            ),
          ),
        ),
        enableSafeArea: true,
        duration: Duration(minutes: 25),
        allowClick: true,
        onlyOne: false,
        targetContext: context,
        target: context == null ? Offset(0, 0) : null,
      );

  @override
  void initState() {
    showToast('New Notif');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Container(
              color: Theme.of(context).backgroundColor.withOpacity(0.2),
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
                      // color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Builder(builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              showToast('new post', context);
            });
            return Wrap(
              children: List.generate(
                list.length,
                (index) => Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListingCard(title: list[index].title)),
              ),
            );
          }),
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
