import 'package:delivery_app/models/store.dart';
import 'package:delivery_app/services/store_service.dart';
import 'package:flutter/cupertino.dart';

class StoreProvider extends ChangeNotifier {
  Store _store;
  StoreService storeService = StoreService();

  Store get store => _store;

  set store(Store store) {
    _store = store;
    notifyListeners();
  }

  Future<Store> findStoreById(int id) async {
    var store = await storeService.findById(id);
    this.store = store;
    return store;
  }
}
