import 'dart:convert';
import 'dart:math';

import 'package:delivery_app/models/store.dart';
import 'package:delivery_app/providers/store_provider.dart';
import 'package:delivery_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

const STORE_ID = 1;

class StoreLoader extends StatefulWidget {
  @override
  _StoreLoaderState createState() => _StoreLoaderState();
}

class _StoreLoaderState extends State<StoreLoader> {
  bool _error = false;
  bool _loading = true;
  StoreProvider _storeProvider;

  @override
  void didChangeDependencies() {
    if (_storeProvider == null) {
      _storeProvider = Provider.of<StoreProvider>(context);
      _storeProvider.findStoreById(1).then((store) {
        setState(() {
          _loading = false;
        });
      });
    }
//      http.get(
//        "http://10.0.2.2:8080/stores/$STORE_ID",
//        headers: {"Content-Type": "application/json"},
//      ).then((r) {
//        bool error = false;
//        Store store;
//        if (r.statusCode == 200) {
//          String body = utf8.decode(r.bodyBytes);
//          store = Store.fromJson(json.decode(body));
//          storeProvider.store = store;
//        } else {
//          _error = true;
//        }
//        setState(() {
//          _loading = false;
//          _error = error;
//        });
//      });
//    }
    super.didChangeDependencies();
  }

  Widget buildScreen() {
    if (_loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (_error) {
      return Center(
        child: Text("Error"),
      );
    } else if(_storeProvider.store != null) {
      return Home();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScreen(),
    );
  }
}
