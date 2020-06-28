import 'package:famazon/apis/home_page_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  PriceRange res;
  setUp(() {
      res = PriceRange.fromJson(jsonDecode('{"from": 1, "to": 2}'));
  });

  group('test', () {
    test("same from", () {
      expect(res.from, 1);
    });
  });

  group('test', () {
    test("same to", () {
      expect(res.to, 2);
    });
  });
}