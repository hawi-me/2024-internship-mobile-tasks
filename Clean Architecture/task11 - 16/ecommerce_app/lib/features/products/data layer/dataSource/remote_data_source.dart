import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/productmodel.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductById(String id);
  Future<List<ProductModel>> getProductAll();
  Future<void> deleteById(String id);
  Future<ProductModel> insertProduct(ProductModel product);
  Future<ProductModel> updateProduct(String id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> getProductById(String id) async {
    final response = await client.get(Uri.parse(Urls.currentProductById(id)));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'][0];
      return ProductModel.fromJson(data);
    } else {
      throw ServerException(message: 'server error');
    }
  }

  @override
  Future<List<ProductModel>> getProductAll() async {
    final response = await client.get(Uri.parse(Urls.ProductAll()));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((productJson) => ProductModel.fromJson(productJson)).toList();
    } else {
      throw ServerException(message: 'server error');
    }
  }

  @override
  Future<void> deleteById(String id) async {
    final response = await client.delete(Uri.parse(Urls.DelelteByid(id)));
    if (response.statusCode != 200) {
      throw ServerException(message: 'server error');
    }
  }

  @override
  Future<ProductModel> insertProduct(ProductModel product) async {
    final response = await client.post(
      Uri.parse(Urls.ProductAll()), // Assuming POST request to the base URL adds a new product
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(product.toJson()),
    );

    if (response.statusCode == 201) {  // Assuming a 201 Created response
      final data = json.decode(response.body)['data'];
      return ProductModel.fromJson(data);
    } else {
      throw ServerException(message: 'server error');
    }
  }

  @override
  Future<ProductModel> updateProduct(String id) async {
    final response = await client.put(
      Uri.parse(Urls.updateById(id)));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String,dynamic>;
      return ProductModel.fromJson(data);
    } else {
      throw ServerException(message: 'server error');
    }
  }
}
