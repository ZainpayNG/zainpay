class MerchantTransactionResponse {
  String? code;
  List<Data>? data;
  String? description;
  String? status;

  MerchantTransactionResponse(
      {this.code, this.data, this.description, this.status});

  MerchantTransactionResponse.fromJson(Map<String, dynamic> json) {
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
  String? accountNumber;
  int? amount;
  int? balance;
  String? narration;
  String? transactionDate;
  String? transactionRef;
  String? transactionType;

  Data(
      {this.accountNumber,
        this.amount,
        this.balance,
        this.narration,
        this.transactionDate,
        this.transactionRef,
        this.transactionType});

  Data.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    amount = json['amount'];
    balance = json['balance'];
    narration = json['narration'];
    transactionDate = json['transactionDate'];
    transactionRef = json['transactionRef'];
    transactionType = json['transactionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountNumber'] = accountNumber;
    data['amount'] = amount;
    data['balance'] = balance;
    data['narration'] = narration;
    data['transactionDate'] = transactionDate;
    data['transactionRef'] = transactionRef;
    data['transactionType'] = transactionType;
    return data;
  }
}
