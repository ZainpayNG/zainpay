import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/update_va_status_response.dart';

import '../../utils.dart';
import '../response/va_balance_response.dart';

class UpdateVirtualAccountStatusRequest {

  final String zainboxCode;
  final String accountNumber;
  final String status;
  final String publicKey;
  final bool isTest;

  UpdateVirtualAccountStatusRequest({
    required this.accountNumber,
    required this.status,
    required this.zainboxCode,
    required this.publicKey,
    required this.isTest
  });

  @override
  String toString() => jsonEncode(toJson());

  /// Converts this instance to json
  Map<String, dynamic> toJson() => {
    "zainboxCode": zainboxCode,
    "accountNumber": accountNumber,
    "status": status
  };

  /// Executes network call to initiate transactions
  Future<UpdateVirtualAccountStatusResponse?> updateVirtualAccountStatus() async {

    UpdateVirtualAccountStatusResponse? updateVirtualAccountStatusResponse = UpdateVirtualAccountStatusResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.updateVirtualAccountStatusUrl}";

    final response = await http.patch(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        },
        body: toString()
    );

    final responseBody = jsonDecode(response.body);
    updateVirtualAccountStatusResponse = UpdateVirtualAccountStatusResponse.fromJson(responseBody);

    return updateVirtualAccountStatusResponse;
  }

  /// Executes network call to initiate transactions
  Future<VirtualAccountBalanceResponse?> virtualAccountBalance(accountNumber) async {

    VirtualAccountBalanceResponse? virtualAccountBalanceResponse = VirtualAccountBalanceResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.virtualAccountBalanceUrl}/$accountNumber";

    final response = await http.get(Uri.parse(url),
      headers: {
        "Authorization" : "Bearer $publicKey",
        "Content-Type" : "application/json"
      },
    );

    final responseBody = jsonDecode(response.body);
    virtualAccountBalanceResponse = VirtualAccountBalanceResponse.fromJson(responseBody);

    return virtualAccountBalanceResponse;
  }
}