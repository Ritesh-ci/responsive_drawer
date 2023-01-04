import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:responsive_drawer/auth/auth_service.dart';
import 'package:responsive_drawer/homePage/home_service.dart';
import 'package:responsive_drawer/preferences/preference_service.dart';

class Injection {
  static String? baseUrl;
  static final Injector injector = Injector();
  static final AuthService _authService = AuthService();
  static final Dio _dio = Dio();
  static final PreferenceService _preferenceService = PreferenceService();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final HomeService _homeService = HomeService();

  static Future<void> init(String url) async {
    baseUrl = url;
    _dio.options.baseUrl = baseUrl!;
    _dio.options.connectTimeout = 5000;

    injector.map<Dio>((injector) => _dio, isSingleton: true);
    injector.map<AuthService>((injector) => _authService, isSingleton: true);
    injector.map<PreferenceService>((injector) => _preferenceService,
        isSingleton: true);
    injector.map<HomeService>((injector) => _homeService, isSingleton: true);
  }
}
