import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase.dart';
import '../repositeries/productRepositery.dart';

class DelelteById extends useCase<Unit, DeleteProductparms> {
  final ProductRepository repository;

  DelelteById(this.repository);

  @override
  Future<Either<Failure, Unit>> call(DeleteProductparms params) async {
    return await repository.deleteProduct(params.id);
  }
}

class DeleteProductparms {
  final String id;
  const DeleteProductparms({required this.id});
}

