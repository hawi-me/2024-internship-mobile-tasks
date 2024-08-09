import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/product/repositeries/productRepositery.dart';
import 'package:ecommerce_app/features/products/domain/product/usecases/deleteProduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'deleteproduct_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository mockProductRepository;
  late DelelteById delelteById;

  setUp(() {
    mockProductRepository = MockProductRepository();
    delelteById = DelelteById(mockProductRepository);
  });

  const tProductId = 'id';
  

  test('should delete product by ID from the repository', () async {
    // Arrange
    when(mockProductRepository.deleteProduct(tProductId))
        .thenAnswer((_) async => const Right(unit));

    // Act
    final result = await delelteById(DeleteProductparms(id: tProductId));

    // Assert
    expect(result, const Right(unit));
    verify(mockProductRepository.deleteProduct(tProductId));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
