import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/merchant_transactions_response.dart';

import '../../utils.dart';

class MerchantTransactionsRequest {

  final bool isTest;
  final String publicKey;
  final String? count;

  MerchantTransactionsRequest({required this.isTest, this.count, required this.publicKey});

  /// Executes network call to initiate transactions
  Future<MerchantTransactionResponse?> getMerchantTransactions() async {

    MerchantTransactionResponse? merchantTransactionResponse = MerchantTransactionResponse();

    final url = count != null ? "${Utils.getBaseUrl(isTest)}/${Utils.merchantTransactionsUrl}?count=$count"
        : "${Utils.getBaseUrl(isTest)}/${Utils.merchantTransactionsUrl}";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    merchantTransactionResponse = MerchantTransactionResponse.fromJson(responseBody);

    return merchantTransactionResponse;
  }
}