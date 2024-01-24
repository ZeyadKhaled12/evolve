import 'package:flutter/material.dart';

class AppConstance {
  static String baseUrl = 'https://stg.rep.start-tech.ae';
  static String loginUrl = '$baseUrl/api/login';
  static String addUserUrl = '$baseUrl/api/add-form-data';
  static String forgetPasswordUrl = '$baseUrl/api/forgot-password';
  static String updateInfoUrl = '$baseUrl/api/update-user';

  static double heightOfBottomBar(BuildContext context) =>
      MediaQuery.of(context).size.height * 1 / 10;

  static String userLocalKey = 'user';
  static String setUsersConnectionLocalKey = 'users_connection';
  static String setUsersLocalKey = 'users';
  static String loginNowLocalKey = 'login_now';
}
