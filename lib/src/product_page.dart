import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String productID;
  ProductPage({Key key, @required this.productID}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('productID ids ${this.productID}'),
        ),
      ),
    );
  }
}