import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/driver/drift_driver.dart';
import 'package:rento/src/list_time/list_time_controller.dart';
import 'package:rento/src/select_time/select_time_view.dart';
import 'package:rento/src/widgets/text/text_widget.dart';

import '../select_time/select_time_service.dart';

final _listTimeProvider =
    StateNotifierProvider<ListTimeController, List<TimeScheme>>(
  (ref) => ListTimeController(
    timeService: SelectTimeService(),
  ),
);

class ListTimeView extends StatelessWidget {
  const ListTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final listTime = ref.watch(_listTimeProvider);
        // ref.read(_listTimeProvider.notifier).getList();

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              showModalBottomSheet(
                context: context,
                builder: (_) => Scaffold(
                  body: BottomSheet(
                    builder: (context) => const SelectTimeView(),
                    onClosing: () {
                      ref.read(_listTimeProvider.notifier).getList();
                    },
                  ),
                ),
              );
            },
          ),
          body: listTime.isEmpty
              ? Center(child: TextWidget.bold34('No Data'))
              : ListView.builder(
                  itemCount: listTime.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: TextWidget.medium16('Paket Malam'),
                      trailing: TextWidget.light12(
                          '${listTime[index].durationMinutes} Menit'),
                    );
                  },
                ),
        );
      },
    );
  }
}
