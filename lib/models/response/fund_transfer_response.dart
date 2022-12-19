class FundTransferResponse {
  String? code;
  String? description;
  String? status;

  FundTransferResponse({this.code, this.description, this.status});

  FundTransferResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}
