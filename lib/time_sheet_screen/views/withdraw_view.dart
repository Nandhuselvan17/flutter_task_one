import 'package:apk_test_one/time_sheet_screen/model/withdraw_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apk_test_one/time_sheet_screen/provider/withdraw_provider.dart';
import 'package:apk_test_one/time_sheet_screen/views/tab_views/withdraw_tab.dart';


class WithdrawView extends ConsumerWidget {
  const WithdrawView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncWithdraw = ref.watch(withdrawProvider);
    Future<void> _refresh() async {
      ref.invalidate(withdrawProvider);
    }

    return asyncWithdraw.when(
      data: (withdrawModel) {
        final grouped = <String, List<Shift>>{};

        for (var weekData in withdrawModel.weekDataList) {
          grouped.putIfAbsent(weekData.week, () => []).addAll(weekData.shifts);
        }

        print("Grouped weeks count: ${grouped.length}");
        print('WithdrawModel: ${withdrawModel.toString()}');


        return RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: grouped.entries.length,
            itemBuilder: (context, index) {
              final entry = grouped.entries.elementAt(index);
              print("Rendering week: ${entry.key} with ${entry.value.length} shifts");

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      entry.key,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Builder(
                    builder: (_) {
                      try {
                        return WithdrawTab(shifts: entry.value);
                      } catch (e, st) {
                        print("Error rendering WithdrawTab for ${entry.key}: $e\n$st");
                        return Text('Error loading shifts for ${entry.key}');
                      }
                    },
                  ),

                ],
              );
            },
          ),
        );
      },
      loading: () {
        print("Loading withdraw data...");
        return const Center(child: CircularProgressIndicator());
      },
      error: (e, _) {
        print("Error loading withdraw data: $e");
        return Center(child: Text('Error: $e'));
      },
    );
  }

}
