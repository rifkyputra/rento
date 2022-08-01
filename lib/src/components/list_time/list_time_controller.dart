import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/core/driver/drift_driver.dart';
import 'package:rento/src/components/select_time/select_time_service.dart';

class ListTimeController extends StateNotifier<List<TimeScheme>> {
  ListTimeController({required this.timeService}) : super([]);

  final SelectTimeService timeService;

  getList() async {
    try {
      final result = await timeService.getLocal();

      state = result;
    } catch (e) {
      //
    }
  }

  delete(TimeScheme timeScheme) async {
    await timeService.deleteLocal(timeScheme);

    getList();
  }
}
