import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils.dart';
import '../response/create_va_response.dart';
import '../response/va_balance_response.dart';

class CreateVirtualAccountRequest {

  final String fullName;
  final String publicKey;
  final String email;
  final String mobileNumber;
  final String zainboxCode;
  final bool isTest;

  CreateVirtualAccountRequest({
    required this.publicKey,
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.zainboxCode,
    required this.isTest
  });

  @override
  String toString() => jsonEncode(toJson());

  /// Converts this instance to json
  Map<String, dynamic> toJson() => {
    "bankType": "wemaBank",
    "firstName": fullName.split(' ')[0],
    "surname": fullName.split(' ')[1],
    "email": email,
    "mobileNumber": mobileNumber,
    "dob": "12-08-2021",
    "gender": "M",
    "address": "BetaStack",
    "title": "Mr",
    "state": "Kano",
    "zainboxCode": zainboxCode
  };

  /// Executes network call to initiate transactions
  Future<CreateVirtualAccountResponse?> createVirtualAccount() async {

    CreateVirtualAccountResponse? createVirtualAccountResponse = CreateVirtualAccountResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.createVirtualAccountUrl}";

    final response = await http.post(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        },
        body: toString()
    );

    final responseBody = jsonDecode(response.body);
    createVirtualAccountResponse = CreateVirtualAccountResponse.fromJson(responseBody);

    return createVirtualAccountResponse;
  }

  /// Executes network call to initiate transactions
  Future<VirtualAccountBalanceResponse?> virtualAccountBalance(publicKey, accountNumber, isTest) async {

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