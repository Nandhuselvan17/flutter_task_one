import 'package:apk_test_one/time_sheet_screen/views/widget/submited_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/submit_model.dart';


//
class SubmitedTab extends StatelessWidget {
  const SubmitedTab({super.key, required this.shifts, required ts});

  final List<SubmittedShift> shifts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: shifts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SubmitedCardWidget(
              shift: shifts[index],
              showRequestButton: false,
            ),
          );
        },
      ),
    );
  }
}
