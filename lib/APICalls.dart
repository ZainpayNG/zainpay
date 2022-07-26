import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Urls.dart';

class APiCalls {

  APiCalls();

  var duration = const Duration(seconds: 20);

  Future<http.Response> getCustomerAccountBalance(token, accountNumber) async {
    var response = await http.get(Uri.parse("$customerVirtualAccountBalance/$accountNumber"),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Content-Type": "application/json"
        })
        .timeout(duration);
    return response;
  }

  Future<http.Response> makeOrder(token, id, amount, deliveryType,
      deliveryAddress, paymentMethod, additionalInfo, deliveryPhone, orderItems) async {
    var response = await http.post(Uri.parse(makeOrderUrl),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Content-Type": "application/json"
        }, body: jsonEncode({
          "customerId": id,
          "amount": double.parse(amount.toString()),
          "deliveryType": deliveryType.toString(),
          "deliveryAddress": deliveryAddress.toString(),
          "paymentMethod": paymentMethod.toString(),
          "additionalInfo": additionalInfo.toString(),
          "deliveryPhone": deliveryPhone.toString(),
          "orderItems": orderItems
        })).timeout(duration);
    return response;
  }

}