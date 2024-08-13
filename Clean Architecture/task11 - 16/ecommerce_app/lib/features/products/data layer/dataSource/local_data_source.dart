import '../models/productmodel.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';

abstract class ProductLocalDataSource {
  Future<ProductModel> getProductById(String id);
  Future<List<ProductModel>> getProductAll();
  Future<void> deleteById(String id);
  Future<void> cacheProduct(ProductModel product);
  Future<void> cacheProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences _sharedPreferences;

  static const String _productsKey = 'PRODUCTS_KEY';

  ProductLocalDataSourceImpl(this._sharedPreferences);
  @override
  Future<ProductModel> getProductById(String id) async {
    final productjson = _sharedPreferences.getString('$_productsKey/$id');
    if (productjson != null) {
      return ProductModel.fromJson(jsonDecode(productjson));
    } else {
      throw const CacheException(message: 'The product was not found in cache');
    }
  }

  @override
  Future<List<ProductModel>> getProductAll() async {
    final productjson = await _sharedPreferences
        .getString(_productsKey); //use to retrive json using productkey

    if (productjson != null) {
      return jsonDecode(productjson)
          .map((e) => ProductModel.fromJson(e))
          .toList(); //used to convert in to list format product model object
    } else {
      throw const CacheException(message: 'product not found in cache');
    }
  }

  @override
  Future<void> cacheProduct(ProductModel product) async {
    await _sharedPreferences.setString(
        '$_productsKey${product.id}', jsonEncode(product.toJson()));
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    await _sharedPreferences.setString(
        _productsKey,
        jsonEncode(
          products.map((e) => e.toJson()).toList(),
        ));
  }

  @override
  Future<void> deleteById(String id) {
    return _sharedPreferences.remove('$_productsKey/$id');
  }
}
