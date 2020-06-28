import 'package:flutter/material.dart';
import 'package:famazon/apis/product_page_api.dart';
import 'package:famazon/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:famazon/my_app_bar/my_app_bar.dart';

class _ProductPageState extends State<ProductPage> {
  Future<ProductPageAPIResponse> response;
  final String productID;

  _ProductPageState(this.productID);

  @override
  void initState() {
    super.initState();
    response = productPageAPIRequest(productID);
  }

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: MyAppBar().build(context),
      // body is the majority of the screen.
      body: FutureBuilder<ProductPageAPIResponse>(
        future: response,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(snapshot.data.product.name),
                    Text("評価: ${snapshot.data.product.reviewAVGScore}"),
                    Text("${snapshot.data.product.reviewCount}"),
                  ],
                ),
                Image.network(snapshot.data.product.images[0]),
                Row(
                  children: <Widget>[
                    Text("価格: ${snapshot.data.product.price}"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("残り在庫数: ${snapshot.data.product.stockCount}"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: () => cart.add(this.productID),
                        child: Text('カートに入れる'),
                      ),
                    ),
                  ],
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class ProductPage extends StatefulWidget {
  final String productID;
  ProductPage(this.productID, {Key key}) : super(key: key);

  @override
  _ProductPageState createState() => new _ProductPageState(productID);
}
