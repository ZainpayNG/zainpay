import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/card_validation_response.dart';

import 'package:zainpay/models/transaction_error.dart';

import '../../utils.dart';

class CardValidationRequest {

  final String sessionId;
  final String cardEncryptionData;
  final String publicKey;

  CardValidationRequest({
    required this.sessionId,
    required this.cardEncryptionData,
    required this.publicKey
  });

  @override
  String toString() => jsonEncode(toJson());

  /// Converts this instance to json
  Map<String, dynamic> toJson() => {
      "sessionId": sessionId,
      "cardEncryptionData": cardEncryptionData
    };

  /// Executes network call to initiate transactions
  Future<CardValidationResponse> cardValidation() async {
    const url = Utils.cardPayment;
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
      return CardValidationResponse.fromJson(responseBody);
    } catch (error) {
      rethrow;
    }
  }
}