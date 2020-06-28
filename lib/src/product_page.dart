import 'package:famazon/src/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:famazon/src/product_page_api.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
      ),
      body: Center(
        child: FutureBuilder<ProductPageAPIResponse>(
          future: response,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('productID id ${this.productID}'),
                  ),
                  Image.network(snapshot.data.product.images[0]),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartPage()),
                      );
                    },
                    child: Text('カートに入れる'),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
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
