import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/products/domain/entities/product.dart';
import 'package:ecommerce_app/features/products/domain/product/repositeries/productRepositery.dart';
import 'package:ecommerce_app/features/products/domain/product/usecases/CreateProduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository mockproductRepository;
  late CreateProduct createProduct;
  setUp(() {
    mockproductRepository = MockProductRepository();
    createProduct = CreateProduct(mockproductRepository);
  });

  const testproduct = Product(
      id: '4',
      name: 'shoe',
      description: 'brand shoe',
      imageUrl: 'imageurl',
      price: 200);

  test('should create product using repository', () async {
    //arrange
    when(mockproductRepository.createProduct(testproduct))
        .thenAnswer((_) async => const Right(testproduct));
    //act
    final result = await createProduct(CreateProductParams(testproduct));

    //assert
    expect(result, const Right(testproduct));
    verify(mockproductRepository.createProduct(testproduct));
    verifyNoMoreInteractions(mockproductRepository);
  });
}
