import 'package:apk_test_one/time_sheet_screen/views/tab_views/unattended_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/unattended_model.dart';

import '../provider/unattended_provider.dart';

class UnattendedView extends ConsumerWidget {
  const UnattendedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unAttendedAsync = ref.watch(unAttendedProvider);
    Future<void> _refresh() async {
      ref.invalidate(unAttendedProvider);
    }

    return unAttendedAsync.when(
      data: (shifts) {
        // Group by week
        final grouped = <String, List<UnattendedShift>>{};
        for (var shift in shifts) {
          grouped.putIfAbsent(shift.date, () => []).add(shift); // You can format `shift.date` to week if needed
        }

        return RefreshIndicator(
          onRefresh: _refresh,
          child: ListView(
            padding: EdgeInsets.zero,
            children: grouped.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      entry.key,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  UnattendedTab(unattendedShifts: entry.value),
                ],
              );
            }).toList(),
          ),
        );
      },
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
    );
  }
}

