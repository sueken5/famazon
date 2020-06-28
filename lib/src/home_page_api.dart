import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<HomePageAPIResponse> homePageAPIRequest() async {
     String val = await rootBundle.loadString('mock/home_page_api_response.json');
     return HomePageAPIResponse.fromJson(jsonDecode(val));
}

class HomePageAPIResponse {
  final List<TimeSaleProduct> _timeSaleProducts;
  final List<RecommendedProduct> _recommendedProducts;
  HomePageAPIResponse(this._timeSaleProducts, this._recommendedProducts);

  List<TimeSaleProduct> get timeSaleProducts => _timeSaleProducts;
  List<RecommendedProduct> get recommendedProducts => _recommendedProducts;

  HomePageAPIResponse.fromJson(Map<String, dynamic> json)
      : _timeSaleProducts = (json['time_sale_products'] as List)
            .map((m) => TimeSaleProduct.fromJson(m))
            .toList(),
        _recommendedProducts = (json['recommended_products'] as List)
            .map((m) => RecommendedProduct.fromJson(m))
            .toList();
}

class TimeSaleProduct {
  final String _imageURL;
  final String _description;
  final PriceRange _priceRange;
  final int _timeLimit;
  TimeSaleProduct(
      this._imageURL, this._description, this._priceRange, this._timeLimit);

  String get imageURL => _imageURL;
  String get description => _description;
  PriceRange get priceRange => _priceRange;
  int get timeLimit => _timeLimit;

  TimeSaleProduct.fromJson(Map<String, dynamic> json)
      : _imageURL = json['image_url'],
        _description = json['description'],
        _priceRange = PriceRange.fromJson(json['price_range']),
        _timeLimit = json['time_limit'];
}

class PriceRange {
  final int _from;
  final int _to;
  PriceRange(this._from, this._to);

  int get from => _from;
  int get to => _to;

  PriceRange.fromJson(Map<String, dynamic> json)
      : _from = json['from'],
        _to = json['to'];
}

class RecommendedProduct {
  final String _id;
  final String _name;
  final int _price;
  final String _imageURL;

  RecommendedProduct(this._id, this._name, this._price, this._imageURL);

  String get id => _id;
  String get name => _name;
  int get price => _price;
  String get imageURL => _imageURL;

  RecommendedProduct.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _price = json['price'],
        _imageURL = json['image_url'];
}
