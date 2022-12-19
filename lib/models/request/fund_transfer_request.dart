import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:zainpay/models/response/fund_transfer_response.dart';

import '../../utils.dart';

class FundTransferRequest {
  String? destinationAccountNumber;
  String? destinationBankCode;
  String? amount;
  String? sourceAccountNumber;
  String? sourceBankCode;
  String? zainboxCode;
  String? txnRef;
  String? narration;
  String? publicKey;
  bool? isTest;

  FundTransferRequest({
    this.destinationAccountNumber,
    this.destinationBankCode,
    this.amount,
    this.sourceAccountNumber,
    this.sourceBankCode,
    this.zainboxCode,
    this.txnRef,
    this.publicKey,
    this.isTest,
    this.narration
  });

  FundTransferRequest.fromJson(Map<String, dynamic> json) {
    destinationAccountNumber = json['destinationAccountNumber'];
    destinationBankCode = json['destinationBankCode'];
    amount = json['amount'];
    sourceAccountNumber = json['sourceAccountNumber'];
    sourceBankCode = json['sourceBankCode'];
    zainboxCode = json['zainboxCode'];
    txnRef = json['txnRef'];
    narration = json['narration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destinationAccountNumber'] = destinationAccountNumber;
    data['destinationBankCode'] = destinationBankCode;
    data['amount'] = amount;
    data['sourceAccountNumber'] = sourceAccountNumber;
    data['sourceBankCode'] = sourceBankCode;
    data['zainboxCode'] = zainboxCode;
    data['txnRef'] = txnRef;
    data['narration'] = narration;
    return data;
  }


  /// Executes network call to initiate transactions
  Future<FundTransferResponse?> transferFund() async {
    FundTransferResponse? transferResponse = FundTransferResponse();

    final url = "${Utils.getBaseUrl(isTest!)}/${Utils.transferUrl}";

    final response = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer $publicKey",
          "Content-Type": "application/json"
        },
        body: toJson()
    );

    final responseBody = jsonDecode(response.body);
    transferResponse = FundTransferResponse.fromJson(responseBody);

    return transferResponse;
  }

}
