class CardValidationResponse {
  String? sessionId;

  CardValidationResponse({
    this.sessionId
  });

  CardValidationResponse.fromJson(Map<String, dynamic> json) {
    sessionId = json['data']['sessionId'];
  }

  /// Converts this instance to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sessionId'] = sessionId;
    return data;
  }
}