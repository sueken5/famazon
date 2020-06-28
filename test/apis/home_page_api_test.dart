import 'package:famazon/apis/home_page_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  HomePageAPIResponse res;
  setUp(() {
      res = HomePageAPIResponse.fromJson(
          jsonDecode('''
{
  "time_sale_products": [
    {
      "image_url": "test_image_url",
      "description": "test_description",
      "price_range": {
        "from": 1,
        "to":2
      },
      "time_limit": 3
    }
  ],
  "recommended_products": [
    {
      "id": "test_id",
      "name": "test_name",
      "image_url": "test_image_url",
      "price":1 
    }
   ]
}
      '''));
  });

    test("expect", () {
      expect(res.timeSaleProducts[0].imageURL, "test_image_url");
      expect(res.timeSaleProducts[0].description, "test_description");
      expect(res.timeSaleProducts[0].priceRange.from, 1);
      expect(res.timeSaleProducts[0].priceRange.to, 2);
      expect(res.timeSaleProducts[0].timeLimit, 3);
      expect(res.recommendedProducts[0].id, "test_id");
      expect(res.recommendedProducts[0].name, "test_name");
      expect(res.recommendedProducts[0].imageURL, "test_image_url");
      expect(res.recommendedProducts[0].price, 1);
    });
}