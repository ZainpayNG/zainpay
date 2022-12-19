import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils.dart';
import '../response/va_balance_response.dart';

class GetVirtualAccountBalanceRequest {

  final bool isTest;
  final String accountNumber;
  final String publicKey;

  GetVirtualAccountBalanceRequest({required this.accountNumber, required this.isTest, required this.publicKey});

  /// Executes network call to initiate transactions
  Future<VirtualAccountBalanceResponse?> getVirtualAccountBalance() async {

    VirtualAccountBalanceResponse? virtualAccountBalanceResponse = VirtualAccountBalanceResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.virtualAccountBalanceUrl}/$accountNumber";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    virtualAccountBalanceResponse = VirtualAccountBalanceResponse.fromJson(responseBody);

    return virtualAccountBalanceResponse;
  }
}