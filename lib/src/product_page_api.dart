class ProductPageAPI {
  final Product _product;
  final List<SimilarProduct> _similarProducts;
  final List<RelatedProduct> _relatedProducts;

  Product get product => _product;
  List<SimilarProduct> get similarProducts => _similarProducts;
  List<RelatedProduct> get relatedProducts => _relatedProducts;

  ProductPageAPI(this._product, this._similarProducts, this._relatedProducts);

  ProductPageAPI.fromJson(Map<String, dynamic> json)
  : _product = Product.fromJson(json["product"]),
    _similarProducts = (json["similar_products"] as List).map((e) => SimilarProduct.fromJson(e)).toList(),
    _relatedProducts = (json["related_products"] as List).map((e) => RelatedProduct.fromJson(e)).toList();
}

class Product {
  final String _id;
  final String _name;
  final ProductPublisher _productPublisher;
  final List<String> _images;
  final int _price;
  final int _stockCount;

  Product(this._id, this._name, this._productPublisher, this._images, this._price, this._stockCount);

  String get id => _id;
  String get name => _name;
  ProductPublisher get productPublisher => _productPublisher;
  List<String> get images => _images;
  int get price => _price;
  int get stockCount => _stockCount;

  Product.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _productPublisher = ProductPublisher.fromJson(json['publisher']),
        _price = json['price'],
        _stockCount = json['stock_count'],
        _images = (json['images'] as List<dynamic>).cast<String>();
}

class ProductPublisher {
  final String _id;
  final String _name;

  String get id => _id;
  String get name => _name;

  ProductPublisher(this._id, this._name);

  ProductPublisher.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'];
}

class Delivery {
  final int _date;
  final HourRange _hourRange;
  final DeliverCompany _deliverCompany;

  int get date => _date;
  HourRange get hourRange => _hourRange;
  DeliverCompany get deliverCompany => _deliverCompany;

  Delivery(this._date, this._hourRange, this._deliverCompany);
  Delivery.fromJson(Map<String, dynamic> json)
  : _date = json["date"],
    _hourRange = HourRange.fromJson(json["hour_range"]), 
    _deliverCompany = DeliverCompany.fromJson(json["company"]);
}

class HourRange {
  final int _from;
  final int _to;

  int get from => _from;
  int get to => _to;

  HourRange(this._from, this._to);

  HourRange.fromJson(Map<String, dynamic> json)
      : _from = json['from'],
        _to = json['to'];
}

class DeliverCompany {
  final String _id;
  final String _name;
  String get id => _id;
  String get name => _name;

  DeliverCompany(this._id, this._name);

  DeliverCompany.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'];
}

class AccompanyProduct {
  final String _id;
  final String _name;
  final String _imageURL;
  final int _price;

  String get id => _id;
  String get name => _name;
  String get imageURL => _imageURL;
  int get price => _price;

  AccompanyProduct(this._id, this._name, this._imageURL, this._price);

  AccompanyProduct.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _imageURL = json['image_url'],
        _price = json['price'];
}

class RelatedProduct {
  final String _id;
  final String _name;
  final String _imageURL;
  final int _price;
  final Review _review;

  String get id => _id;
  String get name => _name;
  String get imageURL => _imageURL;
  int get price => _price;
  Review get review => _review;

  RelatedProduct(this._id, this._name, this._imageURL, this._price, this._review);

  RelatedProduct.fromJson(Map<String, dynamic> json)
  : _id = json["id"],
    _name = json["name"],
    _imageURL = json["image_url"],
    _price = json["price"],
    _review = Review.fromJson(json['review']);
}

class Review {
  final int _count;
  final double _avgScore;

  int get count => _count;
  double get avgScore => _avgScore;

  Review(this._count, this._avgScore);
  Review.fromJson(Map<String, dynamic> json)
      : _count = json['count'],
        _avgScore = json['avg_score'];
}

class SimilarProduct {
  final String _id;
  final String _name;
  final String _imageURL;
  final int _price;
  final Review _review;
  final ProductPublisher _productPublisher;

  String get id => _id;
  String get name => _name;
  String get imageURL => _imageURL;
  int get price => _price;
  Review get review => _review;
  ProductPublisher get productPublisher => _productPublisher;

  SimilarProduct(this._id, this._name, this._imageURL, this._price, this._review, this._productPublisher);

  SimilarProduct.fromJson(Map<String, dynamic> json)
  : _id = json["id"],
    _name = json["name"],
    _imageURL = json["image_url"],
    _price = json["price"],
    _review = Review.fromJson(json["review"]),
    _productPublisher = ProductPublisher.fromJson(json["publisher"]);
}