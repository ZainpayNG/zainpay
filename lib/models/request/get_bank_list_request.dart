import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/bank_list_response.dart';

import '../../utils.dart';

class GetBankListRequest {

  final bool isTest;
  final String publicKey;

  GetBankListRequest({required this.isTest, required this.publicKey});

  /// Executes network call to initiate transactions
  Future<BankListResponse?> getBankListRequest() async {

    BankListResponse? bankListResponse = BankListResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.bankListUrl}";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    bankListResponse = BankListResponse.fromJson(responseBody);


    return bankListResponse;
  }
}