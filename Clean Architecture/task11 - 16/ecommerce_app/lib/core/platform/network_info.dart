import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class Networkinfo {
  Future<bool> get isConnneted;
}

class NeworkInfoImplment extends Networkinfo {
  final InternetConnectionChecker internetConnectionChecker;

  NeworkInfoImplment({required this.internetConnectionChecker});
  
  @override
  // TODO: implement isConnneted
  Future<bool> get isConnneted => internetConnectionChecker.hasConnection;
}
