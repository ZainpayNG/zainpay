import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/va_transactions_response.dart';

import '../../utils.dart';

class GetVirtualAccountTransactionsRequest {

  final bool isTest;
  final String accountNumber;
  final int? count;
  final String publicKey;

  GetVirtualAccountTransactionsRequest({
    required this.accountNumber,
    required this.publicKey,
    this.count = 20,
    required this.isTest
  });

  /// Executes network call to initiate transactions
  Future<VirtualAccountTransactionsResponse?> getVirtualAccountTransactions() async {

    VirtualAccountTransactionsResponse? virtualAccountTransactionsResponse = VirtualAccountTransactionsResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.virtualAccountTransactionsUrl}/$accountNumber/$count";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    virtualAccountTransactionsResponse = VirtualAccountTransactionsResponse.fromJson(responseBody);


    return virtualAccountTransactionsResponse;
  }
}