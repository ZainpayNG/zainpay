import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:zainpay/models/response/initialize_card_payment_response.dart';

import '../../utils.dart';

class CardPaymentRequest {

  bool? isTest;
  String? publicKey;
  String? amount;
  String? txnRef;
  String? mobileNumber;
  String? zainboxCode;
  String? emailAddress;
  String? callBackUrl;

  CardPaymentRequest({
    required this.isTest,
    required this.publicKey,
    required this.amount,
    required this.txnRef,
    required this.mobileNumber,
    required this.zainboxCode,
    required this.emailAddress,
    required this.callBackUrl
  });

  CardPaymentRequest.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    txnRef = json['txnRef'];
    mobileNumber = json['mobileNumber'];
    zainboxCode = json['zainboxCode'];
    emailAddress = json['emailAddress'];
    callBackUrl = json['callBackUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['txnRef'] = txnRef;
    data['mobileNumber'] = mobileNumber;
    data['zainboxCode'] = zainboxCode;
    data['emailAddress'] = emailAddress;
    data['callBackUrl'] = callBackUrl;
    return data;
  }

  /// Executes network call to initiate transactions
  Future<CardPaymentResponse?> initializeCardPayment() async {

    CardPaymentResponse? cardPaymentResponse = CardPaymentResponse();

    final url = "${Utils.getBaseUrl(isTest!)}/${Utils.initializePayment}";

    final response = await http.post(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        },
        body: toJson()
    );

    final responseBody = jsonDecode(response.body);
    cardPaymentResponse = CardPaymentResponse.fromJson(responseBody);

    return cardPaymentResponse;
  }
}
