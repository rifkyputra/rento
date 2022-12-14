import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rento/src/components/components.dart';

final mobileRoute = GoRouter(
  observers: [BotToastNavigatorObserver()],
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      // redirect: redirrectState,
      routes: [
        GoRoute(
          path: CreateRentFormPage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const CreateRentFormPage();
          },
        ),
        GoRoute(
          path: NewBorrowFormPage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const NewBorrowFormPage();
          },
        ),
        GoRoute(
          path: SelectTimePage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const SelectTimePage();
          },
        ),
        GoRoute(
          path: BorrowListingPage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const BorrowListingPage();
          },
        ),
      ],
      builder: (BuildContext context, GoRouterState state) {
        return const MainActionPage();
      },
    ),
  ],
);

final webRoute = GoRouter(
  observers: [BotToastNavigatorObserver()],
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      // redirect: redirrectState,
      routes: [
        GoRoute(
          path: CreateRentFormPage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const CreateRentFormPage();
          },
        ),
        GoRoute(
          path: NewBorrowFormPage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const NewBorrowFormPage();
          },
        ),
        GoRoute(
          path: SelectTimePage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const SelectTimePage();
          },
        ),
        GoRoute(
          path: BorrowListingPage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const BorrowListingPage();
          },
        ),
      ],
      builder: (BuildContext context, GoRouterState state) {
        return const MainActionPage();
      },
    ),
  ],
);

String? redirrectState(GoRouterState state) {
  // TODO: add logic for login
  const isLoggedIn = true;

  if (isLoggedIn) {
    return MainActionPage.route;
  }
}
