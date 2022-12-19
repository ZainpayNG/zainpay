class ZainboxVirtualAccountsBalancesResponse {
  String? code;
  List<Data>? data;
  String? description;
  String? status;

  ZainboxVirtualAccountsBalancesResponse({
    this.code,
    this.data,
    this.description,
    this.status
  });

  ZainboxVirtualAccountsBalancesResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? accountName;
  String? accountNumber;
  int? balanceAmount;
  String? transactionDate;

  Data(
      {this.accountName,
        this.accountNumber,
        this.balanceAmount,
        this.transactionDate});

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
