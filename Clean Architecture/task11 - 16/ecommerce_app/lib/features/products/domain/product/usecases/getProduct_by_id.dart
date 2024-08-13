import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase.dart';
import '../../entities/product.dart';
import '../repositeries/productRepositery.dart';

class GetProductsById extends useCase<Product, GetProductByIdParams> {
  final ProductRepository repository;

  GetProductsById(this.repository);

  @override
  Future<Either<Failure, Product>> call(GetProductByIdParams params) async {
    return await repository.getProductById(params.id);
  }
}

class GetProductByIdParams {
  final String id;

  GetProductByIdParams({required this.id});
}
