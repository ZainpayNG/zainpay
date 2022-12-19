import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/get_all_zainbox_accounts_response.dart';

import '../../utils.dart';

class GetAllZainboxAccountsRequest {

  final bool isTest;
  final String zainboxCodeName;
  final String publicKey;

  GetAllZainboxAccountsRequest({
    required this.zainboxCodeName,
    required this.publicKey,
    required this.isTest});

  /// Executes network call to initiate transactions
  Future<ZainboxAccountResponse?> getAllZainboxAccounts() async {

    ZainboxAccountResponse? zainboxAccountsResponse = ZainboxAccountResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.getAllZainboxAccountsUrl}/$zainboxCodeName";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    zainboxAccountsResponse = ZainboxAccountResponse.fromJson(responseBody);

    return zainboxAccountsResponse;
  }
}