import 'package:flutter/material.dart';
import 'package:zainpay/view/PaymentIntro.dart';

import '../models/charge_response.dart';
import '../models/standard_request.dart';

class Zainpay {

  final BuildContext context;
  final String publicKey;
  final String transactionRef;
  final String email;
  final String fullName;
  final String narration;
  final double amount;

  const Zainpay({
    required this.context,
    required this.publicKey,
    required this.transactionRef,
    required this.email,
    required this.fullName,
    required this.narration,
    required this.amount,
  });

  /// Starts Standard Transaction
  Future<ChargeResponse> charge() async {
    final request = StandardRequest(
      fullName: fullName,
        email: email,
        narration: narration,
        transactionRef: transactionRef,
        amount: amount,
        publicKey: publicKey
    );

    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentIntro(
          context: context,
          standardRequest: request,
        ),
      ),
    );
  }
}