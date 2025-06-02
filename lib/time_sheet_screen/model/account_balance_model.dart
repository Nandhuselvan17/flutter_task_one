class AccountBalanceModel {
  final bool success;
  final Data? data;
  final String message;
  final int statusCode;
  final List<dynamic> errors;

  AccountBalanceModel({
    required this.success,
    this.data,
    required this.message,
    required this.statusCode,
    required this.errors,
  });

  factory AccountBalanceModel.fromJson(Map<String, dynamic> json) {
    return AccountBalanceModel(
      success: json['success'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
      statusCode: json['status_code'],
      errors: json['errors'] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'message': message,
    'status_code': statusCode,
    'errors': errors,
  };
}

class Data {
  final int basicPayAmount;
  final int holidayPayAmount;
  final int withdrawCount;

  Data({
    required this.basicPayAmount,
    required this.holidayPayAmount,
    required this.withdrawCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      basicPayAmount: json['basic_pay_amount'],
      holidayPayAmount: json['holiday_pay_amount'],
      withdrawCount: json['withdraw_count'],
    );
  }

  Map<String, dynamic> toJson() => {
    'basic_pay_amount': basicPayAmount,
    'holiday_pay_amount': holidayPayAmount,
    'withdraw_count': withdrawCount,
  };
}
