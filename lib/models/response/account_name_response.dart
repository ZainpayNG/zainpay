class AccountNameResponse {
  String? code;
  Data? data;
  String? description;
  String? status;

  AccountNameResponse({this.code, this.data, this.description, this.status});

  AccountNameResponse.fromJson(Map<String, dynamic> json) {
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
  String? bankCode;
  String? bankName;

  Data({this.accountName, this.accountNumber, this.bankCode, this.bankName});

  Data.fromJson(Map<String, dynamic> json) {
    accountName = json['accountName'];
    accountNumber = json['accountNumber'];
    bankCode = json['bankCode'];
    bankName = json['bankName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountName'] = accountName;
    data['accountNumber'] = accountNumber;
    data['bankCode'] = bankCode;
    data['bankName'] = bankName;
    return data;
  }
}
