import 'package:apk_test_one/time_sheet_screen/model/account_balance_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class BalanceCard extends StatelessWidget {
  final AccountBalanceModel balance;
  const BalanceCard({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    final basicPay = balance.data?.basicPayAmount ?? 0;
    final holidayPay = balance.data?.holidayPayAmount ?? 0;

    // Format as currency string (you can customize this)
    String formatCurrency(int amount) {
      return '€${(amount / 100).toStringAsFixed(2)}';  // Assuming amounts are in cents
    }

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Balance', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(
              formatCurrency(basicPay),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: DottedLine(
                dashLength: 4.0,
                lineLength: MediaQuery.of(context).size.width * 0.9,
                dashColor: Colors.grey.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text(
                  'Holiday Pay Balance ',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '${formatCurrency(holidayPay)} ',
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
