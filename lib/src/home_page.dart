import 'package:famazon/src/home_page_api.dart';
import 'package:famazon/src/product_page.dart';
import 'package:flutter/material.dart';

class _HomePageState extends State<HomePage> {
  Future<HomePageAPIResponse> response;

  @override
  void initState() {
    super.initState();
    response = homePageAPIRequest();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> ws = [
      timeSale,
      FutureBuilder<HomePageAPIResponse>(
        future: response,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.recommendedProducts[0].imageURL);
            return
              relatedCheckedProducts(
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
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
                    product(context, products[1]),
                  ],
                ),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    product(context, products[2]),
                    product(context, products[3]),
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
  final int price;
  final String imageURL;
  Product(this.id, this.name, this.price, this.imageURL);
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
              builder: (context) => ProductPage(product.id)),
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

