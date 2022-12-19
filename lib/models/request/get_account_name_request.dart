import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils.dart';
import '../response/account_name_response.dart';

class AccountNameRequest {

  final bool isTest;
  final String publicKey;
  final String accountNumber;
  final String bankCode;

  AccountNameRequest({
    required this.isTest,
    required this.publicKey,
    required this.accountNumber,
    required this.bankCode,
  });

  /// Executes network call to initiate transactions
  Future<AccountNameResponse?> getAccountName() async {

    AccountNameResponse? accountNameResponse = AccountNameResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.accountNameUrl}?$bankCode&$accountNumber";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    accountNameResponse = AccountNameResponse.fromJson(responseBody);

    return accountNameResponse;
  }
}