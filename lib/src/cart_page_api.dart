import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<CartPageAPIResponse> cartPageAPIRequest() async {
  String val = await rootBundle.loadString('mock/cart_page_api_response.json');
  return CartPageAPIResponse.fromJson(jsonDecode(val));
}

class CartPageAPIResponse {
  final bool _ok;
  CartPageAPIResponse(this._ok);

  bool get ok => _ok;

  CartPageAPIResponse.fromJson(Map<String, dynamic> json)
      : _ok = json['ok'];
}

