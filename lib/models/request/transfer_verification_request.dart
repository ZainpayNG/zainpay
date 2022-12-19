import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/transfer_verification_response.dart';

import '../../utils.dart';

class TransferVerificationRequest {

  final bool isTest;
  final String publicKey;
  final String txnRef;

  TransferVerificationRequest({
    required this.isTest,
    required this.publicKey,
    required this.txnRef
  });

  /// Executes network call to initiate transactions
  Future<TransferVerificationResponse?> verifyTransfer() async {

    TransferVerificationResponse? transferVerificationResponse = TransferVerificationResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.transactionVerificationUrl}/$txnRef";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    transferVerificationResponse = TransferVerificationResponse.fromJson(responseBody);

    return transferVerificationResponse;
  }
}