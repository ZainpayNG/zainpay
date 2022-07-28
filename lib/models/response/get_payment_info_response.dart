class GetPaymentInfo {
  String? code;
  GetPaymentInfoData? data;
  String? description;
  String? status;

  GetPaymentInfo({
    this.code,
    this.data,
    this.description,
    this.status
  });

  GetPaymentInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = GetPaymentInfoData.fromJson(json['data']);
    description = json['description'];
    status = json['status'];
  }

  /// Converts this instance to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['data'] = data;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}


class GetPaymentInfoData {
  String? amount;
  bool? emailAddress;
  String? failureCallBackUrl;

  GetPaymentInfoData({
    this.amount,
    this.emailAddress,
    this.failureCallBackUrl
  });

  GetPaymentInfoData.fromJson(Map<String, dynamic> data) {
    amount = data['amount'];
    emailAddress = data['emailAddress'];
    failureCallBackUrl = data['failureCallBackUrl'];
  }

  /// Converts this instance to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['emailAddress'] = emailAddress;
    data['failureCallBackUrl'] = failureCallBackUrl;
    return data;
  }

}