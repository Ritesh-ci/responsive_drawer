import 'package:dio/dio.dart';
import 'package:responsive_drawer/common/constant.dart';
import 'package:responsive_drawer/services/base_service.dart';

class HomeService extends BaseService {
  Future<Response> getHomeDetails(String token) async {
    return dio.get("/api/categories",
        options: Options(headers: getHeader(token)));
  }
}
