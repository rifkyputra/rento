import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/select_time/select_time_controller.dart';
import 'package:rento/src/select_time/select_time_service.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

final settingsProvider = ChangeNotifierProvider<SettingsController>(
  (ref) => SettingsController(SettingsService())..loadSettings(),
);



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}
