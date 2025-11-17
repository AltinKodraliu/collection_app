import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product_model.dart';

class ProductLocalDataSource {
  static const cacheKey = "cached_products";

  Future<List<ProductModel>> loadFromAssets() async {
    final jsonString = await rootBundle.loadString("assets/mock/products.json");
    final jsonMap = json.decode(jsonString);

    return (jsonMap['products'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<void> saveRawJsonToCache(String rawJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(cacheKey, rawJson);
  }

  Future<List<ProductModel>> loadFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(cacheKey);

    if (jsonString == null) return [];

    final jsonMap = json.decode(jsonString);

    return (jsonMap['products'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<void> saveParsedListToCache(List<ProductModel> products) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = jsonEncode({
      "products": products.map((e) => e.toJson()).toList(),
    });

    await prefs.setString(cacheKey, jsonString);
  }
}
