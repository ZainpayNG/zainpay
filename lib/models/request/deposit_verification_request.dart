import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils.dart';
import '../response/deposit_verification_response.dart';

class DepositVerificationRequest {

  final bool isTest;
  final String publicKey;
  final String txnRef;

  DepositVerificationRequest({
    required this.isTest,
    required this.publicKey,
    required this.txnRef
  });

  /// Executes network call to initiate transactions
  Future<DepositVerificationResponse?> verifyDeposit() async {

    DepositVerificationResponse? depositVerificationResponse = DepositVerificationResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.depositVerificationUrl}/$txnRef";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    depositVerificationResponse = DepositVerificationResponse.fromJson(responseBody);

    return depositVerificationResponse;
  }
}