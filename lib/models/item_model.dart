import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/entites/item_entity.dart';

class Item {
  final String name;
  final String description;
  final String pictureUrl;
  final double price;

  Item({this.name, this.description, this.pictureUrl, this.price});

  Item copyWith(
      {String name, String description, String pictureUrl, double price}) {
    return Item(
        name: this.name,
        description: this.description,
        pictureUrl: this.pictureUrl,
        price: this.price);
  }

  @override
  String toString() {
    return 'Item {name: $name, description : $description, pictureUrl:$pictureUrl, price: $price}';
  }

  ItemEntity toEntity() {
    return ItemEntity(name, description, pictureUrl, price);
  }

  static Item fromEntity(ItemEntity entity) {
    return Item(
      name: entity.name,
      description: entity.description,
      pictureUrl: entity.pictureUrl,
      price: entity.price,
    );
  }
}
