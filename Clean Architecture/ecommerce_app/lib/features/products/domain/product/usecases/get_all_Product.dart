import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/usecase.dart';
import '../../entities/product.dart';
import '../repositeries/productRepositery.dart';

class GetAllProducts implements useCase<List<Product>, NoParams> {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getProducts();
  }
}

class NoParams {
}