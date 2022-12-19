import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/zainbox_va_balances_response.dart';

import '../../utils.dart';

class GetZainboxVirtualAccountsBalancesRequest {

  final bool isTest;
  final String zainboxCode;
  final String publicKey;

  GetZainboxVirtualAccountsBalancesRequest({
    required this.zainboxCode,
    required this.publicKey,
    required this.isTest
  });

  /// Executes network call to initiate transactions
  Future<ZainboxVirtualAccountsBalancesResponse?> getZainboxVirtualAccountsBalances() async {

    ZainboxVirtualAccountsBalancesResponse? zainboxVirtualAccountsBalancesResponse = ZainboxVirtualAccountsBalancesResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.zainboxVirtualAccountsBalanceUrl}/$zainboxCode";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    zainboxVirtualAccountsBalancesResponse = ZainboxVirtualAccountsBalancesResponse.fromJson(responseBody);

    return zainboxVirtualAccountsBalancesResponse;
  }
}