import 'dart:convert';

import 'package:events_time_microapp_menu/src/products/domain/models/product_model.dart';

class CategoryModel {
  final int id;
  final String name;
  final List<ProductModel> products;

  CategoryModel({
    required this.id,
    required this.name,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'products': products,
    };
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMapExternal(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      products: map['products'] as List<ProductModel>,
    );
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      products: List<ProductModel>.from(
        (map['products'] as List<dynamic>).map<dynamic>(
          (dynamic x) => ProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
