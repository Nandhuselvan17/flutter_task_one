import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TimeSheetTab { submitted, withdraw, flagged ,unattended}

final selectedTabProvider = StateProvider<TimeSheetTab>((ref) => TimeSheetTab.submitted);

