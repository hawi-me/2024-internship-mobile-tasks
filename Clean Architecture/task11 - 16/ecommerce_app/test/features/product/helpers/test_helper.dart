import 'package:ecommerce_app/features/products/data%20layer/dataSource/remote_data_source.dart';
import 'package:ecommerce_app/features/products/domain/product/repositeries/productRepositery.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [ProductRepository,
  ProductRemoteDataSource],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {
  // Your test code here
}
