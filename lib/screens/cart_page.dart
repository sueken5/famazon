import 'package:flutter/material.dart';
import 'package:famazon/apis/cart_page_api.dart';
import 'package:famazon/my_app_bar/my_app_bar.dart';

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
      appBar: MyAppBar().build(context),
      // body is the majority of the screen.
      body: FutureBuilder<CartPageAPIResponse>(
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
    );
  }
}

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => new _CartPageState();
}
