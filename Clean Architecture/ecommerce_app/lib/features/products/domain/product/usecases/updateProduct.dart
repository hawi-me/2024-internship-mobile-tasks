import '../../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/usecase.dart';
import '../../entities/product.dart';
import '../repositeries/productRepositery.dart';

class UpdateProduct implements useCase<Product, updateProductparms> {
  ProductRepository repository;
  UpdateProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(updateProductparms parms) async {
    return await repository.updateProduct(parms.product);
  }
}

class updateProductparms {
  final Product product;
  const updateProductparms(this.product);
}
