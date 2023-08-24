import 'dart:convert';

import 'package:events_time_microapp_menu/src/products/domain/models/stand_model.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final StandModel stand;
  final String? pathImage;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.stand,
    required this.pathImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'stand': stand,
      'pathImage': pathImage
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
      stand: StandModel.fromMap(map['stand'] as Map<String, dynamic>),
      pathImage: map['product_file'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
