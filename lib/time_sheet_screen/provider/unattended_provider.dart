import 'package:apk_test_one/time_sheet_screen/model/unattended_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



final unAttendedProvider = FutureProvider<List<UnattendedShift>>((ref) async {
  final url = Uri.parse("https://run.mocky.io/v3/be72b43a-5783-4767-a405-1ad2a00dbf47");
  final response = await http.get(url);

  if (response.statusCode != 200) {
    print("Failed: ${response.statusCode}");
    throw Exception("Failed: ${response.statusCode}");
  }

  final body = jsonDecode(response.body);
  final shiftList = body["data"]["data"] as List;
  if (body["data"] == null || body["data"]["data"] == null) {
    throw Exception("Invalid response format");
  }

  return shiftList.map((e) => UnattendedShift.fromJson(e)).toList();
});
