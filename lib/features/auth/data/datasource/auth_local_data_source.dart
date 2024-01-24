import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdh_event/features/auth/data/parameters/set_user_parameters.dart';

import '../../../../core/network/error_message_model.dart';
import '../../../../core/network/exception.dart';
import '../../../../core/utils/app_constance.dart';
import '../../models/user/user.dart';

abstract class BaseAuthLocalDataSource {
  Future<void> setLogin(SetUserParameters setUserParameters);
  Future<User> checkIfLogin();
}

class AuthLocalDataSource extends BaseAuthLocalDataSource {
  @override
  Future<User> checkIfLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(AppConstance.loginNowLocalKey)) {
      if (sharedPreferences.getBool(AppConstance.loginNowLocalKey)!) {
        User userModel = User.fromJson(jsonDecode(
            sharedPreferences.getString(AppConstance.userLocalKey)!));
        return userModel;
      }
    }
    throw const ServerException(ErrorMessageModel(statusMessage: 'Not login'));
  }

  @override
  Future<void> setLogin(SetUserParameters setUserParameters) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
        AppConstance.userLocalKey, jsonEncode(setUserParameters.user.toJson()));
    await sharedPreferences.setBool(AppConstance.loginNowLocalKey, true);
  }
}
