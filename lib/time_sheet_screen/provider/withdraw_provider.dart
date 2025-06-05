import 'package:apk_test_one/time_sheet_screen/model/withdraw_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


final withdrawProvider = FutureProvider<WithdrawModel>((ref) async {

  final url = Uri.parse("https://run.mocky.io/v3/28807b48-23ae-4be8-929f-ab2b10f6f217");

  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception("Failed: ${response.statusCode}");
  }

  final body = jsonDecode(response.body) as Map<String, dynamic>;
  return WithdrawModel.fromJson(body);
});


