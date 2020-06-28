import 'package:famazon/apis/product_page_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  ProductPageAPIResponse res;
  setUp(() {
    res = ProductPageAPIResponse.fromJson(jsonDecode('''
{
  "product": {
    "id": "test_product_id",
    "name": "test_product_name",
    "publisher": {
        "id": "test_product_publisher_id",
        "name": "test_product_publisher_name"
    },
    "images": [
      "test_product_image_0"
    ],
    "price": 1,
    "stock_count": 2,
    "delivery": {
      "date": 3,
      "hour_range": {
        "from": 4,
        "to": 5
      },
      "company": {
        "id": "test_product_delivery_company_id",
        "name": "test_product_delivery_company_name"
      }
    }
  },
  "accompany_products": [
    {
      "id": "test_accompany_products_0_id",
      "name": "test_accompany_products_0_name",
      "image_url": "test_accompany_products_0_image_url",
      "price": 6
    }
  ],
  "related_products": [
    {
      "id": "test_related_products_0_id",
      "name": "test_related_products_0_name",
      "image_url": "test_related_products_0_image_url",
      "price": 7,
      "review": {
        "count": 8,
        "avg_score": 1.1
      }
    }
  ],
  "similar_products": [
    {
      "id": "test_similar_products_0_id",
      "name": "test_similar_products_0_name",
      "image_url": "test_similar_products_0_image_url",
      "price": 9,
      "review": {
        "count": 10,
        "avg_score": 1.2
      },
      "deliver": {
        "id": "test_similar_products_0_deliver_id"
      },
      "publisher": {
        "id": "test_similar_products_0_publisher_id",
        "name": "test_similar_products_0_publisher_name"
      }
    }
  ],
  "product_description": "test_product_description",
  "product_detail": {
    "features": [
      "product_detail_features_0"
    ],
    "info": [
      {
        "header": "product_detail_info_0_header",
        "body": "product_detail_info_0_body"
      }
    ]
  }
} 
    '''));
  });

  test("test", () {
    expect(res.product.id, "test_product_id");
  });
}
