import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/product/repositeries/productRepositery.dart';
import 'package:ecommerce_app/features/products/domain/product/usecases/updateProduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository mockProductRepository;
  late UpdateProduct updateProduct;
  setUp(() {
    mockProductRepository = MockProductRepository();
    updateProduct = UpdateProduct(mockProductRepository);
  });
  const testproduct = Product(
      id: '1',
      name: 'name',
      description: 'description',
      price: 200,
      imageUrl: 'imageUrl');
  test('should update the product repository', () async {
    when(mockProductRepository.updateProduct(testproduct))
        .thenAnswer((_) async => Right(testproduct));
    final result = await updateProduct(const updateProductparms(testproduct));

    // assert
    expect(result, const Right(testproduct));
    verify(mockProductRepository.updateProduct(testproduct));
    verifyNoMoreInteractions(mockProductRepository);

  });
}
