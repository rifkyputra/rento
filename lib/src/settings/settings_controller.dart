import 'package:flutter/material.dart';

import 'settings_service.dart';

class SettingsController extends ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  ThemeMode? _themeMode;

  ThemeMode? get themeMode => _themeMode;

  Future<SettingsController> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    notifyListeners();

    return this;
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _settingsService.updateThemeMode(newThemeMode);
  }
}
