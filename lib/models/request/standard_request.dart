import 'dart:convert';
import 'dart:io';

import 'package:zainpay/models/response/standard_response.dart';
import 'package:zainpay/models/transaction_error.dart';

import '../../utils.dart';

class StandardRequest {

  final String publicKey;
  final String transactionRef;
  final String email;
  final String fullName;
  final String narration;
  final double amount;

  StandardRequest({
    required this.publicKey,
    required this.transactionRef,
    required this.email,
    required this.fullName,
    required this.narration,
    required this.amount,
  });

  @override
  String toString() => jsonEncode(_toJson());

  /// Converts this instance to json
  Map<String, dynamic> _toJson() {
    return {
      "publicKey": publicKey,
      "transactionRef": transactionRef,
      "email": email,
      "fullName": fullName,
      "narration": narration,
      "amount": amount
    };
  }

  /// Executes network call to initiate transactions
  Future<StandardResponse> execute(client) async {
    final url = Utils.getBaseUrl();
    final uri = Uri.parse(url);
    try {
      final response = await client.post(uri,
          headers: {
            HttpHeaders.authorizationHeader: publicKey,
            HttpHeaders.contentTypeHeader: 'application/json'
          },
          body: json.encode(_toJson()));
      final responseBody = json.decode(response.body);
      if (responseBody["status"] == "error") {
        throw TransactionError(responseBody["message"] ??
            "An unexpected error occurred. Please try again.");
      }
      return StandardResponse.fromJson(responseBody);
    } catch (error) {
      rethrow;
    }
  }

}