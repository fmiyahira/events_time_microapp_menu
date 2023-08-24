import 'dart:convert';

import 'package:events_time_microapp_menu/src/products/domain/models/category_model.dart';

class MenuModel {
  final List<CategoryModel> categories;

  MenuModel({
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categories': categories,
    };
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromMapExternal(Map<String, dynamic> map) {
    return MenuModel(
      categories: map['categories'] as List<CategoryModel>,
    );
  }

  factory MenuModel.fromMap(List<dynamic> list) {
    return MenuModel(
      categories: List<CategoryModel>.from(
        list.map<dynamic>(
          (dynamic x) => CategoryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
