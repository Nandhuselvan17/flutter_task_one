import 'package:apk_test_one/time_sheet_screen/views/widget/flagged_widget.dart';
import 'package:flutter/cupertino.dart';
import '../../model/flagged_model.dart';

class FlaggedTab extends StatelessWidget {
  final FlaggedShift shift;

  const FlaggedTab(this.shift, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FlaggedWidget(
        shift: shift,
        showRequestButton: shift.getApproval,
      ),
    );
  }
}

