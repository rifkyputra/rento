import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/driver/drift_driver.dart';
import 'package:rento/src/select_time/select_time_service.dart';

class ListTimeController extends StateNotifier<List<TimeScheme>> {
  ListTimeController({required this.timeService}) : super([]);

  final SelectTimeService timeService;

  getList() async {
    try {
      final result = await timeService.getLocal();

      print('result : $result');

      state = result;
    } catch (e) {
      //
    }
  }
}
