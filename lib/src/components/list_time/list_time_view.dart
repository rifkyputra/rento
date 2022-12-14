import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rento/src/core/core.dart';
import 'package:rento/src/components/select_time/select_time_view.dart';
import 'package:rento/src/core/platform/mobile.dart';
import 'package:rento/src/shared/widgets/text/text_widget.dart';

class ListTimeView extends ConsumerStatefulWidget {
  const ListTimeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ListTimeView> createState() => _ListTimeViewState();
}

class _ListTimeViewState extends ConsumerState<ListTimeView> {
  @override
  void initState() {
    ref.read(listTimeProvider.notifier).getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listTime = ref.watch(listTimeProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const SelectTimeView(),
          );

          ref.read(listTimeProvider.notifier).getList();
        },
      ),
      body: listTime.isEmpty
          ? const Center(
              child: TextWidget.size34('No Data', font: interBold),
            )
          : ListView.builder(
              itemCount: listTime.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: TextWidget.size16(listTime[index].name),
                  subtitle: TextWidget.size12(
                    'Mulai : ${DateFormat('h:mm, d MMM y').format(
                      DateTimeXt.fromSecondEpoch(listTime[index].start ?? 0),
                    )}',
                    font: interLight,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWidget.size12(
                        Duration(minutes: listTime[index].durationMinutes)
                            .sringify(),
                      ),
                      GestureDetector(
                        child: const Icon(Icons.more_vert),
                        onTapDown: (details) {
                          showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(
                                  details.globalPosition.dx,
                                  details.globalPosition.dy,
                                  0,
                                  0),
                              items: [
                                PopupMenuItem(
                                  onTap: () {
                                    // ref
                                    //     .read(listTimeProvider.notifier)
                                    //     .delete(listTime[index]);
                                  },
                                  child: const TextWidget.size12('Delete'),
                                ),
                              ]);
                        },
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}

extension StringDuration on Duration {
  String sringify() {
    if (inHours > 23) {
      return '$inDays days';
    }

    if (inMinutes > 59) {
      var minutes = inMinutes % 60;
      return '$inHours hours ${minutes > 0 ? ' $minutes minutes' : ''}';
    }
    return '$inMinutes Minutes';
  }
}
