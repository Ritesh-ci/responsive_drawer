import 'package:dio/dio.dart';
import 'package:responsive_drawer/services/base_service.dart';

class AuthService extends BaseService {
  Future<Response> signIn(String email, String password) async {
    return dio.post("/api/auth/local",
        data: {"identifier": email, "password": password});
  }
}
