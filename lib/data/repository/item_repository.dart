import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/entites/item_entity.dart';
import 'package:e_comerce_app/models/item_model.dart';

abstract class ItemRepository {
  Future<void> addItem(Item item);
  Future<void> deleteItem(Item item);
  Future<void> updateIte(Item item);
  Stream<List<Item>> items();
}

class FirebaseItemRepository implements ItemRepository {
  final itemColection = FirebaseFirestore.instance.collection("items");

  @override
  Future<void> addItem(Item item) {
    return itemColection.add(item.toEntity().toDocument());
  }

  @override
  Future<void> deleteItem(Item item) {
    return itemColection.doc(item.name).delete();
  }

  @override
  Stream<List<Item>> items() {
    return itemColection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Item.fromEntity(ItemEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateIte(Item update) {
    return itemColection
        .doc(update.name)
        .update(update.toEntity().toDocument());
  }
}
