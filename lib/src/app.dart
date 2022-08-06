import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rento/main.dart';
import 'package:rento/src/components/main_action/main_action_view.dart';
import 'package:rento/src/components/new_borrow_form/new_borrow_form_view.dart';
import 'package:rento/src/components/new_rent_form/new_rent_form_view.dart';
import 'package:rento/src/components/select_time/select_time_view.dart';
import 'package:sizer/sizer.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final themeMode = ref.watch(settingsProvider).themeMode;

        return Sizer(builder: (context, orientation, device) {
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
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: themeMode,
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
          );
        });
      },
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MainActionPage();
        },
      ),
      GoRoute(
        path: '/${NewRentFormPage.route}',
        builder: (BuildContext context, GoRouterState state) {
          return const NewRentFormPage();
        },
      ),
      GoRoute(
        path: '/${NewBorrowFormPage.route}',
        builder: (BuildContext context, GoRouterState state) {
          return const NewBorrowFormPage();
        },
      ),
      GoRoute(
        path: '/${SelectTimePage.route}',
        builder: (BuildContext context, GoRouterState state) {
          return const SelectTimePage();
        },
      ),
    ],
  );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
