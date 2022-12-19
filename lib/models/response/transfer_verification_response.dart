class TransferVerificationResponse {
  String? code;
  Data? data;
  String? description;
  String? status;

  TransferVerificationResponse(
      {this.code, this.data, this.description, this.status});

  TransferVerificationResponse.fromJson(Map<String, dynamic> json) {
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
  String? amount;
  String? destinationAccountNumber;
  String? destinationBankCode;
  String? narration;
  String? sourceAccountNumber;
  String? txnDate;
  String? txnStatus;

  Data(
      {this.amount,
        this.destinationAccountNumber,
        this.destinationBankCode,
        this.narration,
        this.sourceAccountNumber,
        this.txnDate,
        this.txnStatus});

  Data.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    destinationAccountNumber = json['destinationAccountNumber'];
    destinationBankCode = json['destinationBankCode'];
    narration = json['narration'];
    sourceAccountNumber = json['sourceAccountNumber'];
    txnDate = json['txnDate'];
    txnStatus = json['txnStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['destinationAccountNumber'] = destinationAccountNumber;
    data['destinationBankCode'] = destinationBankCode;
    data['narration'] = narration;
    data['sourceAccountNumber'] = sourceAccountNumber;
    data['txnDate'] = txnDate;
    data['txnStatus'] = txnStatus;
    return data;
  }
}
