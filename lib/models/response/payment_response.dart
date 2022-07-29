class PaymentResponse {

  String? code;
  String? description;
  String? status;
  OTPValidationDataResponse? otpValidationDataResponse;

  PaymentResponse({
    this.code,
    this.description,
    this.status,
    this.otpValidationDataResponse
  });

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    status = json['status'];
    otpValidationDataResponse = OTPValidationDataResponse.fromJson(json['data']);
  }

  /// Converts this instance to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['description'] = description;
    data['status'] = status;
    data['data'] = otpValidationDataResponse;
    return data;
  }
}

class OTPValidationDataResponse {

  String? callBackUrl;
  String? txnRef;

  OTPValidationDataResponse({
    this.callBackUrl,
    this.txnRef
  });

  OTPValidationDataResponse.fromJson(Map<String, dynamic> json) {
    callBackUrl = json['code'];
    txnRef = json['code'];
  }

  /// Converts this instance to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['callBackUrl'] = callBackUrl;
    data['txnRef'] = txnRef;
    return data;
  }
}