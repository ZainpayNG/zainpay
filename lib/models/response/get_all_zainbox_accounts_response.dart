class ZainboxAccountResponse {
  String? code;
  List<Data>? data;

  ZainboxAccountResponse({this.code, this.data});

  ZainboxAccountResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? bankAccount;
  String? bankName;
  String? name;

  Data({this.bankAccount, this.bankName, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    bankAccount = json['bankAccount'];
    bankName = json['bankName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bankAccount'] = bankAccount;
    data['bankName'] = bankName;
    data['name'] = name;
    return data;
  }
}
