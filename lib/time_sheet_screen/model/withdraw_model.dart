

class WithdrawModel {
  final List<WeekData> weekDataList;

  WithdrawModel({required this.weekDataList});

  factory WithdrawModel.fromJson(Map<String, dynamic> json) {
    final outerData = json['data'] as Map<String, dynamic>? ?? {};
    final innerDataList = outerData['data'] as List<dynamic>? ?? [];

    final weekDataList = innerDataList.map((e) => WeekData.fromJson(e)).toList();

    return WithdrawModel(
      weekDataList: weekDataList,
    );
  }
}


class WeekData {
  final String week;
  final String weekId;
  final List<Shift> shifts;

  WeekData({
    required this.week,
    required this.weekId,
    required this.shifts,
  });

  factory WeekData.fromJson(Map<String, dynamic> json) {
    final shiftsList = json['shifts'] as List<dynamic>? ?? [];
    return WeekData(
      week: json['week'] ?? '',
      weekId: json['week_id'] ?? '',
      shifts: shiftsList.map((e) => Shift.fromJson(e)).toList(),
    );
  }
}


class Shift {
  final String id;
  final String date;
  final String shiftCode;
  final Client? client;
  final double totalPayRate;
  final double totalWorkedHours;
  final String shiftTiming;
  final double hourlyRate;
  final int status;
  final int? checkoutType;

  Shift({
    required this.id,
    required this.date,
    required this.shiftCode,
    this.client,
    required this.totalPayRate,
    required this.totalWorkedHours,
    required this.shiftTiming,
    required this.hourlyRate,
    required this.status,
    this.checkoutType,
  });

  factory Shift.fromJson(Map<String, dynamic> json) {
    return Shift(
      id: json['id'] ?? '',
      date: json['date'] ?? '',
      shiftCode: json['shift_code'] ?? '',
      client: json['client'] != null ? Client.fromJson(json['client']) : null,
      totalPayRate: (json['total_pay_rate'] ?? 0).toDouble(),
      totalWorkedHours: (json['total_worked_hours'] ?? 0).toDouble(),
      shiftTiming: json['shift_timing'] ?? '',
      hourlyRate: (json['hourly_rate'] ?? 0).toDouble(),
      status: json['status'] ?? 0,
      checkoutType: json['checkout_type'],
    );
  }
}


class Client {
  final String id;
  final String name;
  final String address;
  final double? checkInDistance;
  final Location? location;
  final County? county;
  final String? photo;
  final int? type;

  Client({
    required this.id,
    required this.name,
    required this.address,
    this.checkInDistance,
    this.location,
    this.county,
    this.photo,
    this.type,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      checkInDistance: (json['check_in_distance'] != null) ? (json['check_in_distance'] as num).toDouble() : null,
      location: json['location'] != null ? Location.fromJson(json['location']) : null,
      county: json['county'] != null ? County.fromJson(json['county']) : null,
      photo: json['photo'],
      type: json['type'],
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    final coords = json['coordinates'] as List<dynamic>? ?? [];
    return Location(
      type: json['type'] ?? '',
      coordinates: coords.map((e) => (e as num).toDouble()).toList(),
    );
  }
}

class County {
  final String id;
  final String name;

  County({
    required this.id,
    required this.name,
  });

  factory County.fromJson(Map<String, dynamic> json) {
    return County(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
