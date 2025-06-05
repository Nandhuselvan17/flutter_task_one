import 'package:apk_test_one/time_sheet_screen/views/tab_views/flagged_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/flagged_provider.dart';




class FlaggedView extends ConsumerWidget {
  const FlaggedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFlaggedData = ref.watch(flaggedProvider);
    Future<void> _refresh() async {
      ref.invalidate(flaggedProvider); // Force re-fetch
    }
    return asyncFlaggedData.when(
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (flaggedModel) {
        final flaggedWeeks = flaggedModel.data.data;
        return RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: flaggedWeeks.length,
            itemBuilder: (context, index) {
              final weekData = flaggedWeeks[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      weekData.week,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...weekData.shifts.map((shift) => FlaggedTab(shift)).toList(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

