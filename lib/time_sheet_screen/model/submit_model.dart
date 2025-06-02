// model/submitted_shift.dart

class SubmittedShift {
  final String id;
  final String date;
  final String shiftCode;
  final String clientName;
  final String? address;
  final double totalPayRate;
  final double hourlyRate;
  final double totalWorkedHours;
  final String shiftTiming;
  final String expectedDate;
  final String week;
  final String weekId;

  SubmittedShift({
    required this.id,
    required this.date,
    required this.shiftCode,
    required this.clientName,
    required this.address,
    required this.totalPayRate,
    required this.hourlyRate,
    required this.totalWorkedHours,
    required this.shiftTiming,
    required this.expectedDate,
    required this.week,
    required this.weekId,
  });

  factory SubmittedShift.fromJson(Map<String, dynamic> json, String week, String weekId) {
    final client = json['client'];
    return SubmittedShift(
      id: json['id'] ?? '',
      date: json['date'] ?? '',
      shiftCode: json['shift_code'] ?? '',
      clientName: client['name'] ?? '',
      address: client['address'],
      totalPayRate: (json['total_pay_rate'] ?? 0).toDouble(),
      hourlyRate: (json['hourly_rate'] ?? 0).toDouble(),
      totalWorkedHours: (json['total_worked_hours'] ?? 0).toDouble(),
      shiftTiming: json['shift_timing'] ?? '',
      expectedDate: json['expected_date'] ?? '',
      week: week,
      weekId: weekId,
    );
  }
}
