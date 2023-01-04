import 'package:dio/dio.dart';
import 'package:responsive_drawer/base/injection.dart';

class BaseService {
  final dio = Injection.injector.get<Dio>();
}
