class CardValidationResponse {

  String? sessionId;
  String? code;
  String? description;
  String? status;

  CardValidationResponse({
    this.sessionId
  });

  CardValidationResponse.fromJson(Map<String, dynamic> json) {
    sessionId = json['data']['sessionId'];
    code = json['code'];
    status = json['status'];
    description = json['description'];
  }

  /// Converts this instance to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['description'] = description;
    data['sessionId'] = sessionId;
    return data;
  }
}