import 'dart:ffi';

import 'package:famazon/src/product_page.dart';
import 'package:flutter/material.dart';

class HomePageAPIResponse {}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> ws = [
      timeSale,
//      relatedCheckedProducts(context),
      FittedBox(
        fit: BoxFit.fitWidth,
        child: recommendedAndPopularProducts,
      ),
    ];
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductPage()),
            );
          },
        ),
        title: Text('famazon.co.jp'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: Center(
        child: buildList(ws),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

Widget buildList(List<Widget> ws) {
  return ListView.separated(
    separatorBuilder: (context, index) => Divider(
      color: Colors.grey,
    ),
    itemCount: ws.length,
    itemBuilder: (context, index) => Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: ws[index]),
    ),
  );
}

final timeSale = Container(
  child: Column(
    children: <Widget>[
      Text('注目のタイムセール'),
      Image.network(
          'https://images-na.ssl-images-amazon.com/images/I/71sJYT6w-sL._AC_SY355_.jpg'),
      Text('定番アイテムから専用ケアまで。人気のビューティー'),
      Text('1,918-2,716'),
      Text('終了まで 2時間21分58秒'),
      Text('タイムセールをもっと見る',
          style: TextStyle(
            color: Colors.blue,
          )),
    ],
  ),
);

Widget relatedCheckedProducts(BuildContext context, List<Product> products) {
  return Container(
    padding: EdgeInsets.only(
      left: 16,
      right: 16,
    ),
    child: Column(
      children: <Widget>[
        Text('チェックした商品の関連商品'),
        Container(
          child: Column(
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    product(context, products[0]),
                    product(context, products[0]),
                  ],
                ),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    product(context, products[0]),
                    product(context, products[0]),
                  ],
                ),
              ),
              Text('オススメの表示と管理'),
            ],
          ),
        )
      ],
    ),
  );
}

class Product {
  final String id;
  final String name;
  final Int64 price;
  final String imageURL;
  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.imageURL});
}

Widget product(BuildContext context, Product product) {
  return Container(
    padding: EdgeInsets.only(
      left: 16,
      right: 16,
    ),
    color: Colors.grey,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductPage(productID: product.id)),
        );
      },
      child: Column(
        children: <Widget>[
          Image.network(product.imageURL),
          Text(product.id),
          Text('${product.price}'),
        ],
      ),
    ),
  );
}

final recommendedAndPopularProducts = Container(
  child: Column(
    children: <Widget>[
      Text('オススメの商品と人気商品'),
      Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/71sJYT6w-sL._AC_SY355_.jpg'),
                Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/71sJYT6w-sL._AC_SY355_.jpg'),
              ],
            ),
            Row(
              children: <Widget>[
                Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/71sJYT6w-sL._AC_SY355_.jpg'),
                Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/71sJYT6w-sL._AC_SY355_.jpg'),
              ],
            ),
            Text('もっとみる'),
          ],
        ),
      )
    ],
  ),
);
