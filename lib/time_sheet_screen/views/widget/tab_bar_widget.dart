import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/account_balancce_provider.dart';
import '../../provider/tab_selection_provider.dart';

class TabBarSection extends ConsumerWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedTabProvider);
    final tabs = {
      'Submitted': TimeSheetTab.submitted,
      'Withdraw': TimeSheetTab.withdraw,
      'Flagged': TimeSheetTab.flagged,
      'Unattended': TimeSheetTab.unattended,
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: tabs.entries.map((entry) {
        final isSelected = selected == entry.value;
        return InkWell(
          onTap: () {
            ref.read(selectedTabProvider.notifier).state = entry.value;
            ref.refresh(selectedTabProvider.notifier).state = entry.value;
            ref.invalidate(accountBalanceProvider);
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  entry.key,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
              ),
              if (isSelected)
                const SizedBox(height: 4), // space between text and underline
              if (isSelected)
                Container(
                  height: 2,
                  width: 80,
                  color: Colors.black,
                ),

            ],
          ),
        );
      }).toList(),
    );
  }
}
