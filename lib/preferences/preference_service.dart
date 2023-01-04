import 'package:responsive_drawer/preferences/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  Future<SharedPreferences> _getPref() => SharedPreferences.getInstance();
  final _const = PrefConst();

  // Future<void> saveSignInResponse(UserInfo? value) async {
  //   (await _getPref()).setString(_const.prefRegisterUser, json.encode(value));
  // }

  // Future<UserInfo?> getSignInResponse() async {
  //   final data = (await _getPref()).getString(_const.prefRegisterUser);
  //   if (data != null && data.isNotEmpty) {
  //     return UserInfo.fromJson(json.decode(data));
  //   } else {
  //     return null;
  //   }
  // }

  // Future<void> clearPreferences() async {
  //   (await _getPref()).clear();
  // }
}
