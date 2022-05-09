import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  String title;
  String description;
  String pictureUrl;
  double price;

  ItemEntity(this.title, this.description, this.pictureUrl, this.price);

  Map<String, Object> toJson() {
    return {
      'title': title,
      'description': description,
      'pictureUrl': pictureUrl,
      'price': price
    };
  }

  static ItemEntity fromJson(Map<String, Object> json) {
    return ItemEntity(json['title'] as String, json['description'] as String,
        json['pictureUrl'] as String, json['price'] as double);
  }

  static ItemEntity fromSnapshot(DocumentSnapshot snap) {
    return ItemEntity(
      snap.data()['title'],
      snap.data()['description'],
      snap.data()['pictureUrl'],
      snap.data()['price'],
    );
  }
  ItemEntity.fromDocumentSnapshot(Map<String, dynamic> snap)
      : title = snap["title"],
        description = snap["description"],
        pictureUrl = snap["pictureUrl"],
        price = snap["price"];

  Map<String, Object> toDocument() {
    return {
      'title': title,
      'description': description,
      'pictureUrl': pictureUrl,
      'price': price
    };
  }

  @override
  String toString() {
    return 'ItemEntity(title: $title, description: $description, pictureUrl: $pictureUrl, price: $price)';
  }

  @override
  List<Object> get props => [title, description, pictureUrl, price];
}
