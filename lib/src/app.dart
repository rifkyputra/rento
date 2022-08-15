import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/core/platform/mobile.dart';
import 'package:rento/src/core/platform/not_supported.dart';
import 'package:rento/src/core/platform/web.dart';
import 'package:sizer/sizer.dart';

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
            case DeviceType.mac:
            case DeviceType.windows:
            case DeviceType.linux:
              return const WebApp();
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
