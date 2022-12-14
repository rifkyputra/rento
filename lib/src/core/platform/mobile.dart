import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/main.dart';
import 'package:rento/src/app.dart';
import 'package:rento/src/components/list_time/list_time_controller.dart';
import 'package:rento/src/components/create_rent_form/create_rent_form_controller.dart';
import 'package:rento/src/components/create_rent_form/create_rent_form_model.dart';
import 'package:rento/src/components/create_rent_form/create_rent_form_service.dart';
import 'package:rento/src/components/select_time/select_time_controller.dart';
import 'package:rento/src/components/select_time/select_time_model.dart';
import 'package:rento/src/components/select_time/select_time_service.dart';
import 'package:rento/src/components/transactions/transactions_controller.dart';
import 'package:rento/src/components/transactions/transactions_service.dart';
import 'package:rento/src/core/core.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rento/src/core/router/app_router.dart';
import 'package:rento/src/shared/models/models.dart';

final dbProvider = StateProvider<SqliteDb>((ref) => SqliteDb.instance);

final rentFormProvider = ChangeNotifierProvider<CreateRentFormController>(
  (ref) => CreateRentFormController(
    formModel: NewRentFormModel(),
    service: CreateRentFormService(sqliteDatabase: SqliteDb.instance),
  ),
);

final SelectTimeService _selectTimeService =
    SelectTimeService(SqliteDb.instance);

final durationSelectProvider = ChangeNotifierProvider<SelectTimeController>(
  (ref) => SelectTimeController(
    _selectTimeService,
    TimeDuration(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 4)),
    ),
  ),
);

final dateSelectProvider = ChangeNotifierProvider<SelectTimeController>(
  (ref) => SelectTimeController(
    _selectTimeService,
    TimeDuration(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 4)),
    ),
  ),
);

final listTimeProvider =
    StateNotifierProvider<ListTimeController, List<TimeScheme>>(
  (ref) => ListTimeController(
    timeService: SelectTimeService(SqliteDb.instance),
  ),
);

final transactionsProvider = StateNotifierProvider<TransactionsProvider, List>(
  (_) => TransactionsProvider(
    TransactionService(SqliteDb.instance),
  ),
);

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final themeMode = ref.watch(settingsProvider).themeMode;

      return MaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior(),
        builder: BotToastInit(),
        // navigatorObservers: [BotToastNavigatorObserver()],
        restorationScopeId: 'app',
        localizationsDelegates: const [
          // AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
        ],
        // onGenerateTitle: (BuildContext context) =>
        //     AppLocalizations.of(context)!.appTitle,
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
        routeInformationProvider: mobileRoute.routeInformationProvider,
        routeInformationParser: mobileRoute.routeInformationParser,
        routerDelegate: mobileRoute.routerDelegate,
      );
    });
  }
}
