import 'package:flutter/material.dart';
import 'package:famazon/models/cart.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    // Scaffold is a layout for the major Material Components.
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        tooltip: 'Navigation menu',
        onPressed: null,
      ),
      title: Text('famazon.co.jp'),
      actions: <Widget>[
        Stack(
          children: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: null,
            ),
            cart.count == 0
                ? new Container()
                : new Positioned(
                    child: new Stack(
                      children: <Widget>[
                        new Icon(Icons.brightness_1,
                            size: 20.0, color: Colors.green[800]),
                        new Positioned(
                            top: 3.0,
                            right: 4.0,
                            child: new Center(
                              child: new Text(
                                cart.count.toString(),
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    ),
                  ),
          ],
        )
      ],
    );
    // body is the majority of the screen.
  }
}
