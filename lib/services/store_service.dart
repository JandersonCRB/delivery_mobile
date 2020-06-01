import 'package:delivery_app/models/store.dart';

class StoreService {
  Future<Store> findById(int id) async {
    var store = Store(
      id: id,
      name: 'Loja de construções do João',
      color: 'FF0000',
    );
    return store;
  }
}
