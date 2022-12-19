import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/get_all_zainboxes_response.dart';

import '../../utils.dart';

class GetAllZainboxesRequest {

  final bool isTest;

  GetAllZainboxesRequest({required this.isTest});

  /// Executes network call to initiate transactions
  Future<GetAllZainboxesResponse?> getAllZainboxes(publicKey) async {

    GetAllZainboxesResponse? getAllZainboxesResponse = GetAllZainboxesResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.getAllZainboxesUrl}";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    getAllZainboxesResponse = GetAllZainboxesResponse.fromJson(responseBody);

    return getAllZainboxesResponse;
  }
}