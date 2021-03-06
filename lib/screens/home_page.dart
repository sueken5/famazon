import 'package:famazon/apis/home_page_api.dart';
import 'package:famazon/my_app_bar/my_app_bar.dart';
import 'package:famazon/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:famazon/models/cart.dart';
import 'package:provider/provider.dart';

class _HomePageState extends State<HomePage> {
  Future<HomePageAPIResponse> response;

  @override
  void initState() {
    super.initState();
    response = homePageAPIRequest();
  }

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    List<Widget> ws = [
      timeSale,
      FutureBuilder<HomePageAPIResponse>(
        future: response,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return relatedCheckedProducts(
                context,
                snapshot.data.recommendedProducts
                    .map((e) => Product(e.id, e.name, e.price, e.imageURL))
                    .toList());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      )
    ];
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: MyAppBar().build(context),
      // body is the majority of the screen.
      body: buildList(ws),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

Widget buildList(List<Widget> ws) {
  return ListView.separated(
    separatorBuilder: (context, index) => Divider(
      color: Colors.grey,
    ),
    itemCount: ws.length,
    itemBuilder: (context, index) => Padding(
      padding: EdgeInsets.all(8.0),
      child: ws[index],
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
      top: 2,
      bottom: 2,
      left: 2,
      right: 2,
    ),
    child: Column(
      children: <Widget>[
        Text('チェックした商品の関連商品'),
        Container(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: product(context, products[0]),
                  ),
                  SizedBox(width: 2),
                  Expanded(
                    child: product(context, products[1]),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: product(context, products[2]),
                  ),
                  SizedBox(width: 2),
                  Expanded(
                    child: product(context, products[3]),
                  ),
                ],
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
  final int price;
  final String imageURL;
  Product(this.id, this.name, this.price, this.imageURL);
}

Widget product(BuildContext context, Product product) {
  return Container(
    padding: EdgeInsets.only(
      top: 2,
      bottom: 2,
      left: 2,
      right: 2,
    ),
    color: Colors.white70,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductPage(product.id)),
        );
      },
      child: Column(
        children: <Widget>[
          Image.network(product.imageURL),
          Text(product.name),
          Text('${product.price}'),
        ],
      ),
    ),
  );
}
