import 'package:delivery_app/providers/home_provider.dart';
import 'package:delivery_app/providers/store_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeProvider _homeProvider;

  @override
  void didChangeDependencies() {
    if (_homeProvider == null) {
      print("AQUI");
      _homeProvider = Provider.of<HomeProvider>(context);
      _homeProvider.findProductsByStoreId(1);
      print(_homeProvider.hashCode);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var storeProvider = Provider.of<StoreProvider>(context);
    var store = storeProvider.store;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ProductListWidget(),
      ),
    );
  }
}

class ProductListWidget extends StatefulWidget {
  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    print(homeProvider.hashCode);
    print(homeProvider.productsList.length);
    return Container();
  }
}
