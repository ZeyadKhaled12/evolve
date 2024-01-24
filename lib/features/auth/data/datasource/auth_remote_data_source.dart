import 'dart:convert';

import 'package:tdh_event/core/general_fun.dart';
import 'package:tdh_event/core/utils/app_constance.dart';
import 'package:tdh_event/features/auth/data/parameters/forget_password_parameters.dart';

import '../../../../core/network/error_message_model.dart';
import '../../../../core/network/exception.dart';
import '../../models/user/user.dart';
import '../parameters/login_parameters.dart';
import 'package:http/http.dart' as http;

abstract class BaseAuthRemoteDataSource {
  Future<User> login(LoginParameters loginParameters);
  Future<String> forgotPassword(
      ForgetPasswordParameters forgetPasswordParameters);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<User> login(LoginParameters loginParameters) async {
    if (GeneralFun.checkEmailFormat(loginParameters.email)) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Email badly formatted'));
    }
    final req = http.MultipartRequest('POST', Uri.parse(AppConstance.loginUrl))
      ..fields['password'] = loginParameters.password
      ..fields['email'] = loginParameters.email;

    req.headers['Accept'] = 'application/json';
    req.headers['lang'] = 'en';

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return User.fromJson(jsonDecode(res.body)['data']);
    }
    throw const ServerException(
        ErrorMessageModel(statusMessage: 'Email not found'));
  }

  @override
  Future<String> forgotPassword(
      ForgetPasswordParameters forgetPasswordParameters) async {
    if (GeneralFun.checkEmailFormat(forgetPasswordParameters.email)) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Email badly formatted'));
    }

    final req =
        http.MultipartRequest('POST', Uri.parse(AppConstance.forgetPasswordUrl))
          ..fields['email'] = forgetPasswordParameters.email;

    req.headers['Accept'] = 'application/json';
    req.headers['lang'] = 'en';

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return jsonDecode(res.body)['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(jsonDecode(res.body)));
  }
}
