import 'package:e_comerce_app/data/services/firebase_service.dart';
import 'package:e_comerce_app/models/item_model.dart';

class ItemRepository {
  final _firebaseService = FirebaseService();

  Future<void> addItem(Item item) => _firebaseService.addItem(item);

  Future<void> deleteItem(Item item) => _firebaseService.deleteItem(item);

  Stream<List<Item>> items() => _firebaseService.items();

  Future<void> updateIte(Item item) => _firebaseService.updateIte(item);
}
