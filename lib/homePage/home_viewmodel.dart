import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:responsive_drawer/base/base_view_model.dart';
import 'package:responsive_drawer/base/injection.dart';
import 'package:responsive_drawer/homePage/home_service.dart';
import 'package:responsive_drawer/models/home_model.dart';
import 'package:responsive_drawer/preferences/preference_service.dart';

class HomeViewModel extends BaseViewModel {
  final prefService = Injection.injector.get<PreferenceService>();
  final homeService = Injection.injector.get<HomeService>();
  HomeModel? homeModel;
  final List<HomeModel> homeList = [];

  Future<bool> getHomeDetails() async {
    setViewState(ViewState.IDLE);
    try {
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjksImlhdCI6MTY3MjcyNzIwMiwiZXhwIjoxNjc1MzE5MjAyfQ.ikn7fqx7mmWyPV17mzzNjwR1JOs6zuDokpDRqMCcs-o";
      final response = await homeService.getHomeDetails(token);
      for (var postObj in (response.data['data'] as List)) {
        postObj['attributes']['id'] = postObj['id'];

        final post = HomeModel.fromJson(postObj['attributes']);
        homeList.add(post);
      }
      print(homeList);
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
