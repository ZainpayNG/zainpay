import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/zainbox_profile_response.dart';

import '../../utils.dart';

class ZainboxProfileRequest {

  final bool isTest;
  final String zainboxCode;
  final String publicKey;

  ZainboxProfileRequest({
    required this.zainboxCode,
    required this.publicKey,
    required this.isTest
  });

  /// Executes network call to initiate transactions
  Future<ZainboxProfileResponse?> getZainboxProfile() async {

    ZainboxProfileResponse? zainboxProfileResponse = ZainboxProfileResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.zainboxProfileUrl}/$zainboxCode";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    zainboxProfileResponse = ZainboxProfileResponse.fromJson(responseBody);

    return zainboxProfileResponse;
  }
}