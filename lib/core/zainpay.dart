import 'package:flutter/material.dart';
import 'package:zainpay/view/PaymentIntro.dart';

import '../models/request/standard_request.dart';
import '../models/response/payment_response.dart';

class Zainpay {

  final BuildContext context;
  final String publicKey;
  final String transactionRef;
  final String email;
  final String fullName;
  final String mobileNumber;
  final String zainboxCode;
  final String successCallBackUrl;
  final String failureCallBackUrl;
  final double amount;

  const Zainpay({
    required this.context,
    required this.publicKey,
    required this.transactionRef,
    required this.email,
    required this.fullName,
    required this.mobileNumber,
    required this.zainboxCode,
    required this.amount,
    required this.successCallBackUrl,
    required this.failureCallBackUrl
  });

  /// Starts Standard Transaction
  Future<PaymentResponse> charge() async {

    final StandardRequest request = StandardRequest(
      fullName: fullName,
      email: email,
      transactionRef: transactionRef,
      amount: amount,
      zainboxCode: zainboxCode,
      publicKey: publicKey,
      successCallBackUrl: successCallBackUrl,
      failureCallBackUrl: failureCallBackUrl,
      mobileNumber: mobileNumber,
    );

    return await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentIntro(
            context: context,
            standardRequest: request,
          ),
        ));
  }
}