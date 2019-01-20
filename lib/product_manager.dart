import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager(this.startingProduct) {
    print('[ProductManager Widget] Constructor ');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductManager Widget] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    //initState는 build() 보다 앞서서 수행된다. 따라서 setState()을 할 필요가 없다.

    print('[ProductManager State] initState() ');
    super.initState();
    _products.add(widget.startingProduct);
  }

  @override
    void didUpdateWidget(ProductManager oldWidget) {
      // TODO: implement didUpdateWidget
      print('[ProductManager State] didUpdateWidget()');
      super.didUpdateWidget(oldWidget);
    }
  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              _products.add('Advanced Food Tester');
              print(_products);
            });
          },
          child: Text('Add Product'),
        ),
      ),
      Products(_products)
    ]);
  }
}
