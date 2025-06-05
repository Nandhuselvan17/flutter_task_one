

class FlaggedModel {
  final bool success;
  final FlaggedData data;
  final String message;
  final int statusCode;
  final List<dynamic> errors;

  FlaggedModel({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errors,
  });

  factory FlaggedModel.fromJson(Map<String, dynamic> json) {
    return FlaggedModel(
      success: json['success'],
      data: FlaggedData.fromJson(json['data']),
      message: json['message'],
      statusCode: json['status_code'],
      errors: json['errors'],
    );
  }
}

class FlaggedData {
  final List<FlaggedWeek> data;
  final double totalPayRate;
  final int totalCount;
  final int perPage;
  final int currentPage;

  FlaggedData({
    required this.data,
    required this.totalPayRate,
    required this.totalCount,
    required this.perPage,
    required this.currentPage,
  });

  factory FlaggedData.fromJson(Map<String, dynamic> json) {
    return FlaggedData(
      data: List<FlaggedWeek>.from(json['data'].map((e) => FlaggedWeek.fromJson(e))),
      totalPayRate: (json['total_pay_rate'] as num).toDouble(),
      totalCount: json['total_count'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
    );
  }
}

class FlaggedWeek {
  final String week;
  final String weekId;
  final List<FlaggedShift> shifts;

  FlaggedWeek({
    required this.week,
    required this.weekId,
    required this.shifts,
  });

  factory FlaggedWeek.fromJson(Map<String, dynamic> json) {
    return FlaggedWeek(
      week: json['week'],
      weekId: json['week_id'],
      shifts: List<FlaggedShift>.from(json['shifts'].map((e) => FlaggedShift.fromJson(e))),
    );
  }
}

class FlaggedShift {
  final String id;
  final String date;
  final String shiftCode;
  final Client client;
  final double totalPayRate;
  final double totalWorkedHours;
  final String shiftTiming;
  final double hourlyRate;
  final int status;
  final String? expectedDate;
  final int? checkoutType;
  final bool getApproval;
  final String? disputeReason;

  FlaggedShift({
    required this.id,
    required this.date,
    required this.shiftCode,
    required this.client,
    required this.totalPayRate,
    required this.totalWorkedHours,
    required this.shiftTiming,
    required this.hourlyRate,
    required this.status,
    this.expectedDate,
    this.checkoutType,
    required this.getApproval,
    this.disputeReason,
  });

  factory FlaggedShift.fromJson(Map<String, dynamic> json) {
    return FlaggedShift(
      id: json['id'],
      date: json['date'],
      shiftCode: json['shift_code'],
      client: Client.fromJson(json['client']),
      totalPayRate: (json['total_pay_rate'] as num).toDouble(),
      totalWorkedHours: (json['total_worked_hours'] as num).toDouble(),
      shiftTiming: json['shift_timing'],
      hourlyRate: (json['hourly_rate'] as num).toDouble(),
      status: json['status'],
      expectedDate: json['expected_date'],
      checkoutType: json['checkout_type'],
      getApproval: json['get_approval'],
      disputeReason: json['dispute_reason'],
    );
  }
}

class Client {
  final String id;
  final String name;
  final String address;
  final int checkInDistance;
  final Location location;
  final County county;
  final String? photo;
  final List<dynamic> preference;
  final int type;
  final dynamic regionalManager;
  final dynamic sdrEmail;
  final int breakTimePayment;

  Client({
    required this.id,
    required this.name,
    required this.address,
    required this.checkInDistance,
    required this.location,
    required this.county,
    this.photo,
    required this.preference,
    required this.type,
    this.regionalManager,
    this.sdrEmail,
    required this.breakTimePayment,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      checkInDistance: json['check_in_distance'],
      location: Location.fromJson(json['location']),
      county: County.fromJson(json['county']),
      photo: json['photo'],
      preference: json['preference'],
      type: json['type'],
      regionalManager: json['regional_manager'],
      sdrEmail: json['sdr_email'],
      breakTimePayment: json['break_time_payment'],
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
    return Location(
      type: json['type'],
      coordinates: List<double>.from(json['coordinates'].map((x) => (x as num).toDouble())),
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
      id: json['id'],
      name: json['name'],
    );
  }
}
