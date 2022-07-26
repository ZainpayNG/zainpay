import 'package:flutter/material.dart';
import 'package:zainpay/zainpay.dart';

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {

  final zainPay = const ZainPay(
      publicKey: "publicKey",
      redirectUrl: "www.testexample.com",
      transactionRef: "12345678765",
      email: "test@zainpay.ng",
      fullName: "Shahid Sani",
      narration: "Payment Testing",
      amount: 120.0
  );

  @override
  Widget build(BuildContext context) {
    return zainPay;
  }
}
