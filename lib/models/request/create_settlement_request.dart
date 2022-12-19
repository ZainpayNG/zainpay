import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:zainpay/models/response/create_settlement_response.dart';

import '../../utils.dart';

class CreateSettlementRequest {

  String? name;
  String? zainboxCode;
  String? scheduleType;
  String? schedulePeriod;
  String? publicKey;
  List<SettlementAccount>? settlementAccountList;
  bool? status;
  bool? isTest;

  CreateSettlementRequest(
      {this.name,
        this.zainboxCode,
        this.scheduleType,
        this.schedulePeriod,
        required this.publicKey,
        required this.isTest,
        this.settlementAccountList,
        this.status});

  CreateSettlementRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    zainboxCode = json['zainboxCode'];
    scheduleType = json['scheduleType'];
    schedulePeriod = json['schedulePeriod'];
    if (json['settlementAccountList'] != null) {
      settlementAccountList = <SettlementAccount>[];
      json['settlementAccountList'].forEach((v) {
        settlementAccountList!.add(SettlementAccount.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['zainboxCode'] = zainboxCode;
    data['scheduleType'] = scheduleType;
    data['schedulePeriod'] = schedulePeriod;
    if (settlementAccountList != null) {
      data['settlementAccountList'] =
          settlementAccountList!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }

  /// Executes network call to initiate transactions
  Future<CreateSettlementResponse?> createSettlement() async {

    CreateSettlementResponse? createSettlementResponse = CreateSettlementResponse();

    final url = "${Utils.getBaseUrl(isTest!)}/${Utils.createSettlement}";

    final response = await http.post(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        },
        body: toJson()
    );

    final responseBody = jsonDecode(response.body);
    createSettlementResponse = CreateSettlementResponse.fromJson(responseBody);

    return createSettlementResponse;
  }
}

class SettlementAccount {
  String? accountNumber;
  String? bankCode;
  String? percentage;

  SettlementAccount({this.accountNumber, this.bankCode, this.percentage});

  SettlementAccount.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    bankCode = json['bankCode'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountNumber'] = accountNumber;
    data['bankCode'] = bankCode;
    data['percentage'] = percentage;
    return data;
  }
}
