class ZainboxProfileResponse {
  String? code;
  String? description;
  String? status;
  Data? data;

  ZainboxProfileResponse({this.code, this.description, this.status, this.data});

  ZainboxProfileResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['description'] = description;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Zainbox? zainbox;
  Account2AccountBilling? account2AccountBilling;
  Account2AccountBilling? interBankBilling;

  Data({this.zainbox, this.account2AccountBilling, this.interBankBilling});

  Data.fromJson(Map<String, dynamic> json) {
    zainbox =
    json['zainbox'] != null ? Zainbox.fromJson(json['zainbox']) : null;
    account2AccountBilling = json['account2AccountBilling'] != null
        ? Account2AccountBilling.fromJson(json['account2AccountBilling'])
        : null;
    interBankBilling = json['interBankBilling'] != null
        ? Account2AccountBilling.fromJson(json['interBankBilling'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (zainbox != null) {
      data['zainbox'] = zainbox!.toJson();
    }
    if (account2AccountBilling != null) {
      data['account2AccountBilling'] = account2AccountBilling!.toJson();
    }
    if (interBankBilling != null) {
      data['interBankBilling'] = interBankBilling!.toJson();
    }
    return data;
  }
}

class Zainbox {
  String? callbackUrl;
  String? codeName;
  String? name;
  String? tags;

  Zainbox({this.callbackUrl, this.codeName, this.name, this.tags});

  Zainbox.fromJson(Map<String, dynamic> json) {
    callbackUrl = json['callbackUrl'];
    codeName = json['codeName'];
    name = json['name'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['callbackUrl'] = callbackUrl;
    data['codeName'] = codeName;
    data['name'] = name;
    data['tags'] = tags;
    return data;
  }
}

class Account2AccountBilling {
  String? fixedCharge;
  double? percentageCharge;

  Account2AccountBilling({this.fixedCharge, this.percentageCharge});

  Account2AccountBilling.fromJson(Map<String, dynamic> json) {
    fixedCharge = json['fixedCharge'];
    percentageCharge = json['percentageCharge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fixedCharge'] = fixedCharge;
    data['percentageCharge'] = percentageCharge;
    return data;
  }
}
