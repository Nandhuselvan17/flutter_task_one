
import 'package:apk_test_one/time_sheet_screen/views/tab_views/submited_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/submit_model.dart';
import '../provider/submit_provider.dart';



class SubmittedTimeSheetView extends ConsumerWidget {
  const SubmittedTimeSheetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncShifts = ref.watch(submittedShiftProvider);
    Future<void> _refresh() async {
      ref.invalidate(submittedShiftProvider); // Force re-fetch
    }


    return asyncShifts.when(
      data: (shifts) {
        // Group shifts by week
        final grouped = <String, List<SubmittedShift>>{};
        for (var shift in shifts) {
          grouped.putIfAbsent(shift.week, () => []).add(shift);
        }

         return RefreshIndicator(
           onRefresh: _refresh,
           child: ListView.builder(
             padding: EdgeInsets.zero,
            itemCount: grouped.entries.length,
            itemBuilder: (context, index) {
              final entry = grouped.entries.elementAt(index);
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
                  SizedBox(height: 16,),

                  SubmitedTab(shifts: entry.value, ts: null),
                ],
              );
            },
                   ),
         );

      },
      loading: () =>  Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
