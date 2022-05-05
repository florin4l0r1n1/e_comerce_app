import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  String name;
  String description;
  String pictureUrl;
  double price;

  ItemEntity(this.name, this.description, this.pictureUrl, this.price);

  Map<String, Object> toJson() {
    return {
      'name': name,
      'description': description,
      'pictureUrl': pictureUrl,
      'price': price
    };
  }

  static ItemEntity fromJson(Map<String, Object> json) {
    return ItemEntity(json['name'] as String, json['description'] as String,
        json['pictureUrl'] as String, json['price'] as double);
  }

  static ItemEntity fromSnapshot(DocumentSnapshot snap) {
    return ItemEntity(
      snap.data()['name'],
      snap.data()['description'],
      snap.data()['pictureUrl'],
      snap.data()['price'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'name': name,
      'description': description,
      'pictureUrl': pictureUrl,
      'price': price
    };
  }

  @override
  String toString() {
    return 'ItemEntity(name: $name, description: $description, pictureUrl: $pictureUrl, price: $price)';
  }

  @override
  List<Object> get props => [name, description, pictureUrl, price];
}
