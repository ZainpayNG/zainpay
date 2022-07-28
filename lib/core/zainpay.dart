import 'package:flutter/material.dart';
import 'package:zainpay/view/PaymentIntro.dart';

import '../models/request/standard_request.dart';
import '../models/response/standard_response.dart';
import '../models/transaction_error.dart';

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

  Future<StandardResponse> startTransaction(final StandardRequest request) async {
    try {
      final StandardResponse standardResponse = await request.initializePayment();
      if (standardResponse.status != "Success" && standardResponse.code != "00") {
        throw (TransactionError(standardResponse.description!));
      }
      return standardResponse;
    } catch (error) {
      debugPrint("error is $error");
      rethrow;
    }
  }

  /// Starts Standard Transaction
  Future<StandardResponse> charge() async {

    final request = StandardRequest(
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

    return await startTransaction(request).whenComplete(() => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentIntro(
          context: context,
          standardRequest: request,
        ),
      ),
    ));
  }
}