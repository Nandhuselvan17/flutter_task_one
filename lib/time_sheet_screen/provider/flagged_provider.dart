import 'package:apk_test_one/time_sheet_screen/model/flagged_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


final flaggedProvider = FutureProvider<FlaggedModel>((ref) async {

  final url = Uri.parse("https://run.mocky.io/v3/8d4be20a-0fe6-4846-ab26-26ccee3374d7");

  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception("Failed: ${response.statusCode}");
  }

  final body = jsonDecode(response.body) as Map<String, dynamic>;
  return FlaggedModel.fromJson(body);
});


