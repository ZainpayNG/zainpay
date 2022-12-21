class CardPaymentResponse {
  String? code;
  String? data;
  String? description;
  String? status;

  CardPaymentResponse({
    this.code,
    this.data,
    this.description,
    this.status
  });

  CardPaymentResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['data'] = this.data;
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}
