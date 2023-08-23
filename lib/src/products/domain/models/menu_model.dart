import 'dart:convert';

import 'package:events_time_microapp_menu/src/products/domain/models/product_model.dart';

class MenuModel {
  final String name;
  final List<ProductModel> products;

  MenuModel({
    required this.name,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'products': products,
    };
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      name: map['name'] as String,
      products: map['products'] as List<ProductModel>,
    );
  }

  factory MenuModel.fromMapExternal(Map<String, dynamic> map) {
    return MenuModel(
      name: map['name'] as String,
      products: map['products'] as List<ProductModel>,
    );
  }
}
