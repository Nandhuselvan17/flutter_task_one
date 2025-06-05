import 'package:flutter/cupertino.dart';
import '../../model/unattended_model.dart';
import '../widget/unatended_widget.dart';


class UnattendedTab extends StatelessWidget {
  final List<UnattendedShift> unattendedShifts;

  const UnattendedTab({super.key, required this.unattendedShifts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: unattendedShifts.map((shift) {
          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: UnatendedWidget(
              shift: shift,
              showRequestButton: false,
            ),
          );
        }).toList(),
      ),
    );
  }
}

