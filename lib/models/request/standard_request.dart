import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:zainpay/models/response/standard_response.dart';
import 'package:zainpay/models/transaction_error.dart';

import '../../utils.dart';

class StandardRequest {

  final String publicKey;
  final String transactionRef;
  final String email;
  final String mobileNumber;
  final String fullName;
  final String zainboxCode;
  final String successCallBackUrl;
  final String failureCallBackUrl;
  final double amount;

  StandardRequest({
    required this.publicKey,
    required this.transactionRef,
    required this.email,
    required this.mobileNumber,
    required this.fullName,
    required this.zainboxCode,
    required this.successCallBackUrl,
    required this.failureCallBackUrl,
    required this.amount,
  });

  @override
  String toString() => jsonEncode(toJson());

  /// Converts this instance to json
  Map<String, dynamic> toJson() => {
      "amount": amount,
      "txnRef": transactionRef,
      "mobileNumber": mobileNumber,
      "zainboxCode": zainboxCode,
      "emailAddress": email,
      "successCallBackUrl": successCallBackUrl,
      "failureCallBackUrl": failureCallBackUrl,
    };

  /// Executes network call to initiate transactions
  Future<StandardResponse> initializePayment() async {
    const url = Utils.initializePayment;
    final uri = Uri.parse(url);
    try {
      final response = await http.post(uri,
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $publicKey",
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: json.encode(toJson()));
      final responseBody = json.decode(response.body);
      if (responseBody["status"] != "Success" && responseBody["code"] != "00") {
        throw TransactionError(responseBody["message"] ??
            "An unexpected error occurred. Please try again.");
      }
      return StandardResponse.fromJson(responseBody);
    } catch (error) {
      rethrow;
    }
  }
}