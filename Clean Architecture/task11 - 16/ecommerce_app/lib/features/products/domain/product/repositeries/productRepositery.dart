import 'package:dartz/dartz.dart';
import '../../entities/product.dart';
import '../../../../../core/error/failure.dart';


abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts(); 
  Future<Either<Failure, Product>> getProductById(String id); 
  Future<Either<Failure, Product>> createProduct(Product product);
  Future<Either<Failure, Product>> updateProduct(Product product);
  Future<Either<Failure, Unit>> deleteProduct(String id);
}
