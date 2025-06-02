import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/account_balance_model.dart';
import '../model/submit_model.dart';


final accountBalanceProvider = FutureProvider<AccountBalanceModel>((ref) async {
  final url = Uri.parse("https://run.mocky.io/v3/395122fc-7fe7-4a3c-9634-29183f017596");
  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception("Failed: ${response.statusCode}");
  }

  final body = jsonDecode(response.body) as Map<String, dynamic>;
  return AccountBalanceModel.fromJson(body);
});
