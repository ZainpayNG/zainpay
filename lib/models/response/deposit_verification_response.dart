class DepositVerificationResponse {
  String? code;
  Data? data;
  String? description;
  String? status;

  DepositVerificationResponse({
    this.code,
    this.data,
    this.description,
    this.status
  });

  DepositVerificationResponse.fromJson(Map<String, dynamic> json) {
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
  Amount? amount;
  String? bankName;
  String? beneficiaryAccountName;
  String? beneficiaryAccountNumber;
  String? narration;
  String? paymentDate;
  String? paymentRef;
  String? sender;
  String? senderName;
  String? txnDate;
  String? txnRef;
  String? txnType;
  String? zainboxCode;

  Data(
      {this.amount,
        this.bankName,
        this.beneficiaryAccountName,
        this.beneficiaryAccountNumber,
        this.narration,
        this.paymentDate,
        this.paymentRef,
        this.sender,
        this.senderName,
        this.txnDate,
        this.txnRef,
        this.txnType,
        this.zainboxCode});

  Data.fromJson(Map<String, dynamic> json) {
    amount =
    json['amount'] != null ? Amount.fromJson(json['amount']) : null;
    bankName = json['bankName'];
    beneficiaryAccountName = json['beneficiaryAccountName'];
    beneficiaryAccountNumber = json['beneficiaryAccountNumber'];
    narration = json['narration'];
    paymentDate = json['paymentDate'];
    paymentRef = json['paymentRef'];
    sender = json['sender'];
    senderName = json['senderName'];
    txnDate = json['txnDate'];
    txnRef = json['txnRef'];
    txnType = json['txnType'];
    zainboxCode = json['zainboxCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (amount != null) {
      data['amount'] = amount!.toJson();
    }
    data['bankName'] = bankName;
    data['beneficiaryAccountName'] = beneficiaryAccountName;
    data['beneficiaryAccountNumber'] = beneficiaryAccountNumber;
    data['narration'] = narration;
    data['paymentDate'] = paymentDate;
    data['paymentRef'] = paymentRef;
    data['sender'] = sender;
    data['senderName'] = senderName;
    data['txnDate'] = txnDate;
    data['txnRef'] = txnRef;
    data['txnType'] = txnType;
    data['zainboxCode'] = zainboxCode;
    return data;
  }
}

class Amount {
  int? amount;

  Amount({this.amount});

  Amount.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    return data;
  }
}
