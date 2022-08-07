import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainActionTabController extends StateNotifier<int> {
  MainActionTabController() : super(0);

  changeTab(int value) => state = value;
}
