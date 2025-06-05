import 'package:apk_test_one/time_sheet_screen/model/withdraw_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/withdraw_card_widget.dart';

class WithdrawTab extends StatelessWidget {
  final List<Shift> shifts;

  const WithdrawTab({super.key, required this.shifts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(

          shifts.length,
              (index) {
            debugPrint('widtraw index val$index: ${shifts[index].client}');

            return Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: WithdrawCardWidget(
                shift: shifts[index],
                showRequestButton: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
