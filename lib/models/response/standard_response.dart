class StandardResponse {
  String? status;
  String? description;
  String? sessionId;
  String? code;

  StandardResponse({this.status, this.sessionId, this.description});

  StandardResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    description = json["description"];
    code = json["code"];
    sessionId = json["data"].toString().split("e=")[1];
  }

  /// Converts this instance to json
  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "description": description,
      "code": code,
      "sessionId": sessionId
    };
  }
}