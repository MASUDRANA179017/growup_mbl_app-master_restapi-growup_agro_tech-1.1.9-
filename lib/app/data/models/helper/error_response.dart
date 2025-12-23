class ErrorResponse {
  ErrorResponse({String? message}) {
    _message = message;
  }

  ErrorResponse.fromJson(dynamic json) {
    _message = json['message'];
  }

  String? _message;

  ErrorResponse copyWith({String? message}) =>
      ErrorResponse(message: message ?? _message);

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}