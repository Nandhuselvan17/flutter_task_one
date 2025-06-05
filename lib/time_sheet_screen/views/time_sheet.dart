import 'package:apk_test_one/time_sheet_screen/provider/account_balancce_provider.dart';
import 'package:apk_test_one/time_sheet_screen/views/submitted_view.dart';
import 'package:apk_test_one/time_sheet_screen/views/unattended_view.dart';
import 'package:apk_test_one/time_sheet_screen/views/withdraw_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/tab_selection_provider.dart';
import 'flagged_view.dart';
import 'widget/balance_card.dart';
import 'widget/tab_bar_widget.dart';
class TimeSheetScreen extends ConsumerWidget {
  const TimeSheetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text('Time Sheet'),
            floating: true,
            pinned: true,
            snap: true,
            forceElevated: innerBoxIsScrolled,
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View Payments",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: const SizedBox(height: 10),
          ),

          SliverToBoxAdapter(
            child: ref.watch(accountBalanceProvider).when(
              data: (balance) {
                if (balance == null || balance.data == null) {
                  return const Text("No balance data available");
                }
                return BalanceCard(balance: balance);
              },
              loading: () => const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, _) => const Padding(
                padding: EdgeInsets.all(16),
                child: Text("Failed to load balance"),
              ),
            ),
          ),

          // TabBarSection - sticky
          SliverPersistentHeader(
            pinned: true,
            delegate: MyHeaderDelegate(),
          ),


        ],
        body: Container(
          padding: const EdgeInsets.only(left: 8.0),
          child: TimeSheetListBody(key: ValueKey(ref)),
        ),
      ),
    );
  }
}
class TimeSheetListBody extends ConsumerWidget {
  const TimeSheetListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedTabProvider);

    switch (selectedTab) {
      case TimeSheetTab.submitted:
        return   SubmittedTimeSheetView();
      case TimeSheetTab.withdraw:
        return  WithdrawView();
      case TimeSheetTab.flagged:
        return   FlaggedView();
      case TimeSheetTab.unattended:
        return UnattendedView();
      default:
        return  Center(child: Text("Unknown Tab"));
    }
  }
}



class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 44.0;

  @override
  double get maxExtent => 56.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      color: Colors.grey.shade50,
      child: const TabBarSection(),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}


















