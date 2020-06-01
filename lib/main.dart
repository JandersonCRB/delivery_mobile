import 'package:delivery_app/components/store_loader.dart';
import 'package:delivery_app/providers/home_provider.dart';
import 'package:delivery_app/providers/store_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProvidersServer(
      child: MaterialApp(home: StoreLoader()),
    );
  }
}

class ProvidersServer extends StatelessWidget {
  final Widget child;

  const ProvidersServer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: StoreProvider(),
        ),
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: child,
    );
  }
}
