library zainpay;

import 'package:flutter/material.dart';
import 'package:zainpay/Constants.dart';

import 'PaymentIntro.dart';

class ZainPay extends StatefulWidget {

  final String publicKey;
  final String redirectUrl;
  final String transactionRef;
  final String email;
  final String fullName;
  final String narration;
  final double amount;

  const ZainPay({
    Key? key,
    required this.publicKey,
    required this.redirectUrl,
    required this.transactionRef,
    required this.email,
    required this.fullName,
    required this.narration,
    required this.amount,
  }) : super(key: key);

  @override
  State<ZainPay> createState() => _ZainPayState();
}

class _ZainPayState extends State<ZainPay> {

  @override
  void initState() {
    super.initState();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaymentIntro(
      email: widget.email,
      amount: widget.amount,
      reference: widget.transactionRef,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: hexToColor(paymentBlueBackgroundColor),
        strokeWidth: .5,
      ),
    );
  }
}

