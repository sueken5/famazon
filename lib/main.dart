import 'package:famazon/screens/cart_page.dart';
import 'package:famazon/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'models/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'famazon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/product': (context) => ProductPage(""),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
