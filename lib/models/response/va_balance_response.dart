class VirtualAccountBalanceResponse {
  String? code;
  Data? data;
  String? description;
  String? status;

  VirtualAccountBalanceResponse({
    this.code,
    this.data,
    this.description,
    this.status
  });

  VirtualAccountBalanceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? accountName;
  String? accountNumber;
  dynamic balanceAmount;
  String? transactionDate;

  Data({
    this.accountName,
    this.accountNumber,
    required this.balanceAmount,
    this.transactionDate
  });

  Data.fromJson(Map<String, dynamic> json) {
    accountName = json['accountName'];
    accountNumber = json['accountNumber'];
    balanceAmount = json['balanceAmount'];
    transactionDate = json['transactionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountName'] = accountName;
    data['accountNumber'] = accountNumber;
    data['balanceAmount'] = balanceAmount;
    data['transactionDate'] = transactionDate;
    return data;
  }
}
