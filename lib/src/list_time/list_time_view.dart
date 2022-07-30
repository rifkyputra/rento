import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rento/src/driver/drift_driver.dart';
import 'package:rento/src/list_time/list_time_controller.dart';
import 'package:rento/src/select_time/select_time_view.dart';
import 'package:rento/src/widgets/text/text_widget.dart';
import 'package:rento/src/extensions/datetime_xt.dart';

import '../select_time/select_time_service.dart';

final _listTimeProvider =
    StateNotifierProvider<ListTimeController, List<TimeScheme>>(
  (ref) => ListTimeController(
    timeService: SelectTimeService(),
  ),
);

class ListTimeView extends ConsumerStatefulWidget {
  const ListTimeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ListTimeView> createState() => _ListTimeViewState();
}

class _ListTimeViewState extends ConsumerState<ListTimeView> {
  @override
  void initState() {
    ref.read(_listTimeProvider.notifier).getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listTime = ref.watch(_listTimeProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => SelectTimeView(),
          );

          ref.read(_listTimeProvider.notifier).getList();
        },
      ),
      body: listTime.isEmpty
          ? Center(child: TextWidget.bold34('No Data'))
          : ListView.builder(
              itemCount: listTime.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: TextWidget.medium16(listTime[index].name),
                  subtitle: TextWidget.light12('Mulai : ' +
                      DateFormat('h:mm, d MMM y').format(
                        DateTimeXt.fromSecondEpoch(listTime[index].start),
                      )),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWidget.medium12(
                        Duration(minutes: listTime[index].durationMinutes)
                            .sringify(),
                      ),
                      GestureDetector(
                        child: Icon(Icons.more_vert),
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
                                    ref
                                        .read(_listTimeProvider.notifier)
                                        .delete(listTime[index]);
                                  },
                                  child: TextWidget.medium12('Delete'),
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
    ;
  }
}

extension StringDuration on Duration {
  String sringify() {
    if (inHours > 23) {
      return '$inDays days';
    }

    if (inMinutes > 59) {
      var minutes = inHours % 60;
      return '$inHours hours ${minutes > 0 ? ' $minutes minutes' : ''}';
    }
    return '$inMinutes Minutes';
  }
}
