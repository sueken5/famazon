import 'package:flutter/material.dart';
import 'package:famazon/src/cart_page_api.dart';

class _CartPageState extends State<CartPage> {
  Future<CartPageAPIResponse> response;

  _CartPageState();

  @override
  void initState() {
    super.initState();
    response = cartPageAPIRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: Center(
        child: FutureBuilder<CartPageAPIResponse>(
          future: response,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("カートページですう");
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

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => new _CartPageState();
}
