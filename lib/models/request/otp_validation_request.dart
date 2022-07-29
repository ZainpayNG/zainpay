import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/card_validation_response.dart';
import 'package:zainpay/models/response/payment_response.dart';

import 'package:zainpay/models/transaction_error.dart';

import '../../utils.dart';

class OTPValidationRequest {

  final String sessionId;
  final String otp;
  final String publicKey;

  OTPValidationRequest({
    required this.sessionId,
    required this.otp,
    required this.publicKey
  });

  @override
  String toString() => jsonEncode(toJson());

  /// Converts this instance to json
  Map<String, dynamic> toJson() => {
      "sessionId": sessionId,
      "otp": otp
    };

  /// Executes network call to initiate transactions
  Future<PaymentResponse> otpValidation() async {
    const url = Utils.otpPayment;
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
      return PaymentResponse.fromJson(responseBody);
    } catch (error) {
      rethrow;
    }
  }
}