import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/product/repositeries/productRepositery.dart';
import 'package:ecommerce_app/features/products/domain/product/usecases/get_all_Product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late GetAllProducts getAllProducts;
  late MockProductRepository mockProductRepository;
  setUp(() {
    mockProductRepository = MockProductRepository();
    getAllProducts = GetAllProducts(mockProductRepository);
  });
  test('should get all products', () async {
    final testproduct = <Product>[];
    when(mockProductRepository.getProducts())
        .thenAnswer((_) async => Right(testproduct));
    final result = await getAllProducts(NoParams());
    expect(result, Right(testproduct));
    verify(mockProductRepository.getProducts());
    verifyNoMoreInteractions(mockProductRepository);
  });
}
