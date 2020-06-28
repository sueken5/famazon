import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<String> _ids = [];

  int get count => _ids.length;

  void add(String productID) {
    _ids.add(productID);
    notifyListeners();
  }
}
