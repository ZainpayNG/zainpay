import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/zainbox_transaction_history_response.dart';

import '../../utils.dart';

class ZainboxTransactionsRequest {

  final bool isTest;
  final String zainboxCode;
  final int? count;
  final String publicKey;

  ZainboxTransactionsRequest({
    required this.zainboxCode,
    required this.publicKey,
    this.count = 20,
    required this.isTest
  });

  /// Executes network call to initiate transactions
  Future<ZainboxTransactionHistoryResponse?> getZainboxTransactionsHistory() async {

    ZainboxTransactionHistoryResponse? zainboxTransactionHistoryResponse = ZainboxTransactionHistoryResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.zainboxTransactionHistoryUrl}/$zainboxCode/$count";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    zainboxTransactionHistoryResponse = ZainboxTransactionHistoryResponse.fromJson(responseBody);

    return zainboxTransactionHistoryResponse;
  }
}