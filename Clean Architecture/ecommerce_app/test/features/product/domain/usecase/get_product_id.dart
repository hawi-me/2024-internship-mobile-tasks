import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/product/repositeries/productRepositery.dart';
import 'package:ecommerce_app/features/products/domain/product/usecases/getProduct_by_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_product_id.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository mockProductRepository;
  late GetProductsById getProductsById;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getProductsById = GetProductsById(mockProductRepository);
  });

  const tProductId = '1';
  const tProduct = Product(
    id: tProductId,
    name: 'Test Product',
    description: 'This is a test product',
    imageUrl: 'http://example.com/product.jpg',
    price: 100,
  );

  test('should get product by ID from the repository', () async {
    // Arrange
    when(mockProductRepository.getProductById(tProductId))
        .thenAnswer((_) async => const Right(tProduct));

    // Act
    final result = await getProductsById(GetProductByIdParams(id: tProductId));

    // Assert
    expect(result, const Right(tProduct));
    verify(mockProductRepository.getProductById(tProductId));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
