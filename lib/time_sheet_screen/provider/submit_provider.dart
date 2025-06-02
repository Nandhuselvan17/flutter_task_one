import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/submit_model.dart';

final submittedShiftProvider = FutureProvider<List<SubmittedShift>>((ref) async {
  final url = Uri.parse("https://run.mocky.io/v3/d606ccd6-6720-40a1-91c7-220f12ddf7b9");
  final response = await http.get(url);

  if (response.statusCode != 200) throw Exception("Failed: ${response.statusCode}");

  final body = jsonDecode(response.body) as Map<String, dynamic>;
  final weeks = (body['data']?['data'] as List<dynamic>?) ?? [];

  return weeks.expand<SubmittedShift>((week ) {
    final weekTitle = week['week'] ?? 'Unknown Week';
    final weekId = week['week_id'] ?? '';
    final shifts = week['shifts'] as List<dynamic>? ?? [];
    return shifts.map((s) => SubmittedShift.fromJson(s, weekTitle, weekId));
  }).toList();
});
