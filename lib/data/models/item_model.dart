import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Item {
  String name;
  String description;
  String pictureUrl;
  double price;

  Item(
      {@required this.name,
      @required this.description,
      @required this.pictureUrl,
      this.price});

  Map<String, Object> toJson() {
    return {
      'name': name,
      'description': description,
      'pictureUrl': pictureUrl,
      'proce': price
    };
  }

  

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'pictureUrl': pictureUrl,
      'price': price,
    };
  }

  Item.fromDocumentSnapshot(Map<String, dynamic> doc)
      : name = doc["name"],
        description = doc["description"],
        pictureUrl = doc["pictureUrl"],
        price = doc["price"];
}
