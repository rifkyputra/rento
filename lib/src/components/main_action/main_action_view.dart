import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rento/src/components/home/home_view.dart';
import 'package:rento/src/components/main_action/main_action_controller.dart';
import 'package:rento/src/components/new_borrow_form/new_borrow_form_view.dart';
import 'package:rento/src/components/new_rent_form/new_rent_form_view.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

final tabProvider = StateNotifierProvider<MainActionTabController, int>(
  (ref) => MainActionTabController(),
);

class MainActionPage extends ConsumerWidget {
  const MainActionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget.size34('Rento', font: poppinsBold),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: ref.watch(tabProvider),
        onDestinationSelected: (val) =>
            ref.read(tabProvider.notifier).changeTab(val),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.clean_hands),
            label: 'Rent',
          ),
          NavigationDestination(
            icon: Icon(Icons.handshake),
            label: 'Borrow',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: ref.watch(tabProvider),
        children: [
          HomeView(),
        ],
      ),
    );
  }
}
