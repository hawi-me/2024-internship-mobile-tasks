import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/product/repositeries/productRepositery.dart';
import '../dataSource/local_data_source.dart';
import '../dataSource/remote_data_source.dart';
import '../models/productmodel.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  final ProductLocalDataSource productLocalDataSource;
  final Networkinfo networkInfo;

  ProductRepositoryImpl({
    required this.productRemoteDataSource,
    required this.productLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Product>> createProduct(Product product) async {
    try {
      if (await networkInfo.isConnneted) {
        final productModel = ProductModel.fromEntity(product);
        final createdProduct = await productRemoteDataSource.insertProduct(productModel);
        productLocalDataSource.cacheProduct(createdProduct);
        return Right(createdProduct);
      } else {
        return  Left(NetworkFailure(''));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String id) async {
    try {
      if (await networkInfo.isConnneted) {
        await productRemoteDataSource.deleteById(id);
        await productLocalDataSource.deleteById(id);
        return const Right(unit);
      } else {
        return  Left(NetworkFailure(''));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    if (await networkInfo.isConnneted) {
      try {
        final product = await productRemoteDataSource.getProductById(id);
        productLocalDataSource.cacheProduct(product);
        return Right(product);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final product = await productLocalDataSource.getProductById(id);
        return Right(product);
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    if (await networkInfo.isConnneted) {
      try {
        final products = await productRemoteDataSource.getProductAll();
        productLocalDataSource.cacheProducts(products);
        return Right(products);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final products = await productLocalDataSource.getProductAll();
        return Right(products);
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
    try {
      if (await networkInfo.isConnneted) {
        final productModel = ProductModel.fromEntity(product);
        final updatedProduct = await productRemoteDataSource.updateProduct(productModel.id);
        productLocalDataSource.cacheProduct(updatedProduct);
        return Right(updatedProduct);
      } else {
        return  Left(NetworkFailure(''));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
