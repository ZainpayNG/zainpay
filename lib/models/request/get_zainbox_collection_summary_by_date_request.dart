import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils.dart';
import '../response/zainbox_collection_summary_by_date_response.dart';

class ZainboxCollectionSummaryByDateRequest {

  final bool isTest;
  final String zainboxCode;
  final String? dateFrom;
  final String? dateTo;
  final String publicKey;

  ZainboxCollectionSummaryByDateRequest({
    required this.zainboxCode,
    this.dateFrom,
    this.dateTo,
    required this.publicKey,
    required this.isTest});

  /// Executes network call to initiate transactions
  Future<ZainboxCollectionSummaryByDateResponse?> getSummary() async {

    ZainboxCollectionSummaryByDateResponse? zainboxCollectionSummaryByDateResponse = ZainboxCollectionSummaryByDateResponse();

    final url = dateFrom != null && dateTo != null ?
    "${Utils.getBaseUrl(isTest)}/${Utils.zainboxCollectionSummaryByDateUrl}/$zainboxCode?dateFrom=$dateFrom&dateTo=$dateTo"
        : dateFrom != null ? "${Utils.getBaseUrl(isTest)}/${Utils.zainboxCollectionSummaryByDateUrl}/$zainboxCode"
        : "${Utils.getBaseUrl(isTest)}/${Utils.zainboxCollectionSummaryByDateUrl}/$zainboxCode?dateFrom=$dateFrom";

    final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization" : "Bearer $publicKey",
          "Content-Type" : "application/json"
        }
    );

    final responseBody = jsonDecode(response.body);
    zainboxCollectionSummaryByDateResponse = ZainboxCollectionSummaryByDateResponse.fromJson(responseBody);

    return zainboxCollectionSummaryByDateResponse;
  }
}