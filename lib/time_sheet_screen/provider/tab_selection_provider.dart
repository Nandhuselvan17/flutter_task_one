import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TimeSheetTab { submitted, withdraw, flagged ,unattended}

final selectedTabProvider = StateProvider<TimeSheetTab>((ref) => TimeSheetTab.submitted);


// import 'package:apk_test_one/time_sheet_screen/model/submit_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../service/api_service_provider.dart';
//
// enum TimeSheetTab { submitted, withdraw, flagged ,unattended}
//
// final selectedTabProvider = StateProvider<TimeSheetTab>((ref) => TimeSheetTab.submitted);
// final submittedTimeSheetProvider = FutureProvider.family<List<SubmittedShift>, Map<String, String>>((ref, args) async {
//   final api = ref.watch(apiServiceProvider);
//   final week = args['week']!;
//   final weekId = args['weekId']!;
//   return await api.fetchSubmittedTimeSheets(week, weekId);
// });
//
//
// final withdrawTimeSheetProvider = FutureProvider<List<WithdrawnTimeSheet>>((ref) async {
//   final api = ref.watch(apiServiceProvider);
//   return await api.fetchWithdrawnTimeSheets();
// });
//
// final flaggedTimeSheetProvider = FutureProvider<List<FlaggedTimeSheet>>((ref) async {
//   final api = ref.watch(apiServiceProvider);
//   return await api.fetchFlaggedTimeSheets();
// });
//
// final unattendedTimeSheetProvider = FutureProvider<List<UnattendedTimeSheet>>((ref) async {
//   final api = ref.watch(apiServiceProvider);
//   return await api.fetchUnattendedTimeSheets();
// });
