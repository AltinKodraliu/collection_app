import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductService {
  final ProductRemoteDataSource remote;
  final ProductLocalDataSource local = ProductLocalDataSource();

  ProductService({required String remoteUrl})
    : remote = ProductRemoteDataSource(remoteUrl: remoteUrl);

  Future<List<ProductModel>> loadProducts() async {
    final online =
        await Connectivity().checkConnectivity() != ConnectivityResult.none;

    if (online) {
      try {
        final jsonStr = await remote.fetchRemoteJson();

        // Save the raw JSON into cache
        await local.saveRawJsonToCache(jsonStr);

        final map = jsonDecode(jsonStr);
        return (map['products'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
      } catch (_) {
        final cached = await local.loadFromCache();
        if (cached.isNotEmpty) return cached;

        return await local.loadFromAssets();
      }
    } else {
      final cached = await local.loadFromCache();
      if (cached.isNotEmpty) return cached;

      return await local.loadFromAssets();
    }
  }
}
