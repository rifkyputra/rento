import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rento/src/components/main_action/main_action_view.dart';
import 'package:rento/src/components/new_borrow_form/new_borrow_form_view.dart';
import 'package:rento/src/components/new_rent_form/new_rent_form_view.dart';
import 'package:rento/src/components/select_time/select_time_view.dart';
import 'package:rento/src/core/platform/mobile.dart';
import 'package:rento/src/core/platform/not_supported.dart';
import 'package:rento/src/core/platform/web.dart';
import 'package:sizer/sizer.dart';

final GoRouter router = GoRouter(
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

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Sizer(
        builder: (context, orientation, device) {
          switch (device) {
            case DeviceType.mobile:
            case DeviceType.tablet:
              return const MobileApp();
            case DeviceType.web:
              return const WebApp();
            case DeviceType.mac:
            case DeviceType.windows:
            case DeviceType.linux:
            case DeviceType.fuchsia:
              return const NotSupportedPlatform();
          }
        },
      );
    });
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
