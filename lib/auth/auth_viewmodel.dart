import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:responsive_drawer/base/base_view_model.dart';
import 'package:responsive_drawer/base/injection.dart';
import 'package:responsive_drawer/preferences/preference_service.dart';

class AuthViewModel extends BaseViewModel {
  final prefService = Injection.injector.get<PreferenceService>();

  Future<bool> singIn(String email, String password) async {
    setViewState(ViewState.IDLE);
    try {
      final response = await authService.signIn(email, password);
      log("$response");
      return true;
    } catch (e) {
      log("$e");
      if (e is DioError) {
        final message = e.response?.data["message"];
        if (message != null) {}
      } else {}
      return false;
    } finally {
      setViewState(ViewState.BUSY);
    }
  }
}
