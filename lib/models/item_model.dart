import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app/entites/item_entity.dart';

class Item {
  final String title;
  final String description;
  final String pictureUrl;
  final double price;

  Item({this.title, this.description, this.pictureUrl, this.price});

  Item copyWith(
      {String title, String description, String pictureUrl, double price}) {
    return Item(
        title: this.title,
        description: this.description,
        pictureUrl: this.pictureUrl,
        price: this.price);
  }

  @override
  String toString() {
    return 'Item {title: $title, description : $description, pictureUrl:$pictureUrl, price: $price}';
  }

  ItemEntity toEntity() {
    return ItemEntity(title, description, pictureUrl, price);
  }

  static Item fromEntity(ItemEntity entity) {
    return Item(
      title: entity.title,
      description: entity.description,
      pictureUrl: entity.pictureUrl,
      price: entity.price,
    );
  }
}
