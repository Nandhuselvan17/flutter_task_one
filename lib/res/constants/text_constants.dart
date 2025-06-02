import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextConstants {
  // App-wide strings
  static const String errorMessage = 'Something went wrong. Please try again.';


  static Color fromHex(String hexString, {double opacity = 1.0}) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    Color color = Color(int.parse(buffer.toString(), radix: 16));
    return color.withOpacity(opacity);
  }




  static LinearGradient linearGradientFromHex(
      List<String> hexColors, {
        Alignment begin = Alignment.topLeft,
        Alignment end = Alignment.bottomRight,
        double opacity = 1.0,
      }) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: hexColors.map((hex) => fromHex(hex, opacity: opacity)).toList(),
    );


  }
  static String formatDate(String dateStr, {String inputFormat = 'dd-MM-yyyy'}) {
    try {
      final date = DateFormat(inputFormat).parse(dateStr);
      return DateFormat('dd MMM E').format(date); // 29 May Thu
    } catch (e) {
      return 'Invalid date';
    }
  }

}

