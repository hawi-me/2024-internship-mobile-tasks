import 'dart:convert';

import 'package:ecommerce_app/features/products/data%20layer/models/productmodel.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import '../../helpers/dummy_data/json_reader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testProductModel = ProductModel(
      id: "3",
      name: "Wireless Headphones",
      description:
          "Noise-cancelling wireless headphones with long battery life.",
      price: 199,
      imageUrl: "https://example.com/images/wireless_headphones.jpg");

  test('should be a subclass of Product entity', () async {
    expect(testProductModel, isA<Product>());
  });

  test('should return a valid model from JSON', () async {
    // Arrange
    final String jsonString =
        readJson('features/product/helpers/dummy_data/dummy_product_response.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    // Act
    final result = ProductModel.fromJson(jsonMap['products'][2]);

    // Assert
    expect(result, equals(testProductModel));
  });

  test('should return a JSON map containing proper data', () async {
    // Act
    final result = testProductModel.toJson();

    // Assert
    final expectedJsonMap = {
      'id': '3',
      "name": "Wireless Headphones",
      "description": "Noise-cancelling wireless headphones with long battery life.",
      "price": 199,
      "imageUrl": "https://example.com/images/wireless_headphones.jpg"
    };
      
  

    expect(result, equals(expectedJsonMap));
  });
}
