class ChargeResponse {
  String? txnRef;
  String? status;

  ChargeResponse({
    this.txnRef,
    this.status
  });

  ChargeResponse.fromJson(Map<String, dynamic> json) {
    txnRef = json['txnRef'];
    status = json['status'];
  }

  /// Converts this instance to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['txnRef'] = txnRef;
    data['status'] = status;
    return data;
  }
}