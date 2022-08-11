import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/main.dart';
import 'package:rento/src/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rento/src/core/router/app_router.dart';

class WebApp extends StatelessWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final themeMode = ref.watch(settingsProvider).themeMode;

      return MaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior(),
        restorationScopeId: 'app',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('id', 'ID'),
        ],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
        routeInformationProvider: webRoute.routeInformationProvider,
        routeInformationParser: webRoute.routeInformationParser,
        routerDelegate: webRoute.routerDelegate,
      );
    });
  }
}
