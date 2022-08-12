import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rento/src/components/home/home_view.dart';
import 'package:rento/src/components/main_action/main_action_controller.dart';
import 'package:rento/src/components/profile/profile_view.dart';
import 'package:rento/src/components/transactions/transactions_view.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

final tabProvider = StateNotifierProvider<MainActionTabController, int>(
  (ref) => MainActionTabController(),
);

class MainActionPage extends ConsumerWidget {
  const MainActionPage({super.key});

  static const route = '/';

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
            label: 'Transactions',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: ref.watch(tabProvider),
        children: const [
          HomeView(),
          TransactionsView(),
          ProfileView(),
        ],
      ),
    );
  }
}
