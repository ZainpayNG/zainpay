import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zainpay/models/response/create_zainbox_response.dart';

import '../../utils.dart';

class CreateZainboxRequest {

  final String name;
  final String tags;
  final String callbackUrl;
  final String email;
  final String publicKey;
  final bool isTest;

  CreateZainboxRequest({
    required this.name,
    required this.tags,
    required this.callbackUrl,
    required this.email,
    required this.publicKey,
    required this.isTest
  });

  @override
  String toString() => jsonEncode(toJson());

  /// Converts this instance to json
  Map<String, dynamic> toJson() => {
    "name": name,
    "tags": tags,
    "callbackUrl": callbackUrl,
    "email": email
  };

  /// Executes network call to initiate transactions
  Future<CreateZainboxResponse?> createZainbox() async {

    CreateZainboxResponse? createZainboxResponse = CreateZainboxResponse();

    final url = "${Utils.getBaseUrl(isTest)}/${Utils.createZainboxUrl}";

    final response = await http.post(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        },
        body: toString()
    );

      final responseBody = jsonDecode(response.body);
      createZainboxResponse = CreateZainboxResponse.fromJson(responseBody);

    return createZainboxResponse;
  }
}