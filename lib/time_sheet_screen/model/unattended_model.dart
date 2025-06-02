class UnattendedShift {
  final String parentId;
  final String shiftId;
  final String client;
  final int checkInDistance;
  final String date;
  final String dateTimeFormat;
  final String endDateTimeFormat;
  final String startTime;
  final String endTime;
  final int distance;
  final String shiftTiming;
  final String type;
  final String county;
  final double longitude;
  final double latitude;
  final double duration;
  final int hourlyRate;
  final double totalPayRate;

  UnattendedShift({
    required this.parentId,
    required this.shiftId,
    required this.client,
    required this.checkInDistance,
    required this.date,
    required this.dateTimeFormat,
    required this.endDateTimeFormat,
    required this.startTime,
    required this.endTime,
    required this.distance,
    required this.shiftTiming,
    required this.type,
    required this.county,
    required this.longitude,
    required this.latitude,
    required this.duration,
    required this.hourlyRate,
    required this.totalPayRate,
  });

  factory UnattendedShift.fromJson(Map<String, dynamic> json) {
    return UnattendedShift(
      parentId: json['parent_id'],
      shiftId: json['shift_id'],
      client: json['client'],
      checkInDistance: json['check_in_distance'],
      date: json['date'],
      dateTimeFormat: json['date_time_format'],
      endDateTimeFormat: json['end_date_time_format'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      distance: json['distance'],
      shiftTiming: json['shift_timing'],
      type: json['type'],
      county: json['county'],
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      duration: (json['duration'] as num).toDouble(),
      hourlyRate: json['hourly_rate'],
      totalPayRate: (json['total_pay_rate'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'parent_id': parentId,
      'shift_id': shiftId,
      'client': client,
      'check_in_distance': checkInDistance,
      'date': date,
      'date_time_format': dateTimeFormat,
      'end_date_time_format': endDateTimeFormat,
      'start_time': startTime,
      'end_time': endTime,
      'distance': distance,
      'shift_timing': shiftTiming,
      'type': type,
      'county': county,
      'longitude': longitude,
      'latitude': latitude,
      'duration': duration,
      'hourly_rate': hourlyRate,
      'total_pay_rate': totalPayRate,
    };
  }
}
