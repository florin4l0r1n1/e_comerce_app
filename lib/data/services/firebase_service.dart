import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/entites/item_entity.dart';
import 'package:e_comerce_app/models/item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseService {
  Future<void> addItem(Item item);
  Future<void> deleteItem(Item item);
  Future<void> updateIte(Item item);
  Stream<List<Item>> items();
}

class FirebaseService implements IFirebaseService {
  final itemColection = FirebaseFirestore.instance.collection('items');
  @override
  Future<void> addItem(Item item) async {
    return itemColection.doc().set(item.toEntity().toDocument());
  }

  @override
  Future<void> deleteItem(Item item) async {
    await itemColection.doc(item.title).delete();
  }

  @override
  Future<void> updateIte(Item item) async {
    await itemColection.doc().update(item.toEntity().toDocument());
  }

  @override
  Stream<List<Item>> items() {
    return itemColection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Item.fromEntity(ItemEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
