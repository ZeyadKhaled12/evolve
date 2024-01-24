import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdh_event/features/auth/models/user/user.dart';
import '../../../../core/utils/app_constance.dart';
import '../../models/user_form.dart';

abstract class BaseHomeLocalDataSource {
  Future<void> setUserLocal(User user);
  Future<List<UserForm>> getUsers();
  Future<List<UserForm>> setUsers(UserForm userModel);
  Future<void> setUserNoConnection(UserForm userModel);
  Future<List<UserForm>> getUsersNoConnection();
  Future<void> clearUserNoConnection();
  Future<void> logOut();
}

class HomeLocalDataSource extends BaseHomeLocalDataSource {
  @override
  Future<List<UserForm>> getUsers() async {
    List<UserForm> users = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(AppConstance.setUsersLocalKey)) {
      users = sharedPreferences
          .getStringList(AppConstance.setUsersLocalKey)!
          .map((e) => UserForm.fromJson(jsonDecode(e)))
          .toList();
    }
    return users;
  }

  @override
  Future<List<UserForm>> setUsers(UserForm userModel) async {
    List<UserForm> users = await getUsers();
    users.add(userModel);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(AppConstance.setUsersLocalKey,
        users.map((e) => jsonEncode(e.toJson())).toList());
    return users;
  }

  @override
  Future<void> logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(AppConstance.loginNowLocalKey, false);
  }

  @override
  Future<void> setUserLocal(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(
        AppConstance.userLocalKey, jsonEncode(user.toJson()));
  }

  @override
  Future<void> setUserNoConnection(UserForm userModel) async {
    List<UserForm> users = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await getUsersNoConnection();
    users.add(userModel);
    await preferences.setStringList(AppConstance.setUsersConnectionLocalKey,
        users.map((e) => jsonEncode(e.toJson())).toList());
  }

  @override
  Future<List<UserForm>> getUsersNoConnection() async {
    List<UserForm> users = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(AppConstance.setUsersConnectionLocalKey)) {
      users = preferences
          .getStringList(AppConstance.setUsersConnectionLocalKey)!
          .map((e) => UserForm.fromJson(jsonDecode(e)))
          .toList();
    }
    return users;
  }

  @override
  Future<void> clearUserNoConnection() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences
        .setStringList(AppConstance.setUsersConnectionLocalKey, []);
  }
}
