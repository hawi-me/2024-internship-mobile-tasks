import '../../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/usecase.dart';
import '../../entities/product.dart';
import '../repositeries/productRepositery.dart';

class CreateProduct implements useCase<Product, CreateProductParams> {
  final ProductRepository repository;

  CreateProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(CreateProductParams params) async {
    return await repository.createProduct(params.product);
  }
}

class CreateProductParams {
  final Product product;

  CreateProductParams(this.product);
}
