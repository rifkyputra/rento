import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/core/driver/drift_driver.dart';

import 'firebase_options.dart';
import 'src/app.dart';
import 'src/components/settings/settings_controller.dart';
import 'src/components/settings/settings_service.dart';

final SqliteDatabase sqliteDatabase = SqliteDatabase();
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

final settingsProvider = ChangeNotifierProvider<SettingsController>(
  (ref) => SettingsController(SettingsService())..loadSettings(),
);

final dbProvider = StateProvider<SqliteDatabase>((ref) => sqliteDatabase);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MyApp()));
}
