import 'dart:convert';
import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:ecommerce_app/features/products/data%20layer/dataSource/remote_data_source.dart';
import 'package:ecommerce_app/features/products/data%20layer/models/productmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';  // Import mockito for using when
import 'package:mockito/annotations.dart';  // Import for mockito annotations

import '../../../helpers/dummy_data/json_reader.dart';
import '../../../helpers/test_helper.mocks.dart';  // Import the generated mocks

// Annotate the class with @GenerateMocks to generate the mock classes
@GenerateMocks([http.Client])
void main() {
  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDataSourceImpl =
        ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  const String id = '6672752cbd218790438efdb0';

  group('get current Product', () {
    test('should return product model with response code 200', () async {
      // Arrange
      when(
        mockHttpClient.get(
          Uri.parse(Urls.currentProductById(id)),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          readJson(
              'features/product/helpers/dummy_data/dummy_product_response.json'),
          200,
        ),
      );

      // Act
      final result = await productRemoteDataSourceImpl.getProductById(id);

      // Assert
      expect(result, isA<ProductModel>());
    });
  });

  group('get all Product', () {
    test('should return all product models with response code 200', () async {
      // Arrange
      when(
        mockHttpClient.get(
          Uri.parse(Urls.ProductAll()),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          readJson(
              'features/product/helpers/dummy_data/dummy_product_response.json'),
          200,
        ),
      );

      // Act
      final result = await productRemoteDataSourceImpl.getProductAll();

      // Assert
      expect(result, isA<List<ProductModel>>());
    });
  });

  group('delete Product by id', () {
    test('should delete product for the id with response code 200', () async {
      // Arrange
      when(
        mockHttpClient.delete(
          Uri.parse(Urls.DelelteByid(id)),
        ),
      ).thenAnswer((_) async => http.Response('', 200));

      // Act
      final call = productRemoteDataSourceImpl.deleteById;

      // Assert
      expect(() => call(id), returnsNormally);
    });
  });

  group('update Product', () {
    final updateData = {
      'name': 'Updated Product Name',
      'description': 'Updated Description',
      'price': 200,
    };

    final productJson = {
      'id': id,
      ...updateData,
      'imageUrl': 'https://example.com/path/to/image.jpg' // Example image URL
    };

    test('when response is 200 should return update data', () async {
      // Arrange
      when(
        mockHttpClient.put(Uri.parse(Urls.updateById(id)))
      ).thenAnswer((_) async => http.Response(
        json.encode(productJson), 200));

      // Act
      final result = await productRemoteDataSourceImpl.updateProduct(id);

      // Assert
      expect(result, isA<ProductModel>());
    });
  });
}
