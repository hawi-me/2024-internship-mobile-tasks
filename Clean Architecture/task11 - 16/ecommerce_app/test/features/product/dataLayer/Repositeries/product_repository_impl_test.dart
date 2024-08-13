// import 'package:ecommerce_app/core/platform/network_info.dart';
// import 'package:ecommerce_app/features/products/data%20layer/Repositeries/productRepository_impl.dart';
// import 'package:ecommerce_app/features/products/data%20layer/dataSource/local_data_source.dart';
// import 'package:ecommerce_app/features/products/data%20layer/dataSource/remote_data_source.dart';
// import 'package:ecommerce_app/features/products/data%20layer/models/productmodel.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockRemoteDataSource extends Mock implements ProductRemoteDatasource {}

// class MockLocalDataSource extends Mock implements ProductLocalDatasource {}

// class MockNetworkInfo extends Mock implements Networkinfo {}

// void main() {
//   late ProductRepositoryImpl repositoryImpl;
//   late MockLocalDataSource mockLocalDataSource;
//   late MockRemoteDataSource mockRemoteDataSource;
//   late MockNetworkInfo mockNetworkInfo;

//   setUp(() {
//     mockLocalDataSource = MockLocalDataSource();
//     mockNetworkInfo = MockNetworkInfo();
//     mockRemoteDataSource = MockRemoteDataSource();
//     repositoryImpl = ProductRepositoryImpl(
//         remoteDatasource: mockRemoteDataSource,
//         localDatasource: mockLocalDataSource,
//         networkinfo: mockNetworkInfo);
//   });

//   group('getConcreteProduct', () {
//     final tproductId = '3';
//     final testproductModel = ProductModel(
//         id: '3',
//         name: 'name',
//         description: 'description',
//         price: 200,
//         imageUrl: 'imageUrl');

//     test('should check if the device is online', () async {
//       when(mockNetworkInfo.isConnneted).thenAnswer((_) async => true);
//       repositoryImpl.getProductById('3');
//       // Additional test logic would go here
//       verify(mockNetworkInfo.isConnneted);
       
//     });
//   });
// }
