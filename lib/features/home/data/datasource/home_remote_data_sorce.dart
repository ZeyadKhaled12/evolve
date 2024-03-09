import 'dart:convert';
import 'dart:developer';

import 'package:tdh_event/core/utils/app_constance.dart';
import 'package:tdh_event/features/auth/models/user/user.dart';

import '../../../../core/general_fun.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/network/exception.dart';
import '../../models/user_form.dart';
import 'package:http/http.dart' as http;

import '../parameters/add_user_form_parameters.dart';
import '../parameters/update_info_parameters.dart';

abstract class BaseHomeRemoteDataSource {
  Future<UserForm> addUser(AddUserFormParameters addUserFormParameters);
  Future<User> updateInfo(UpdateInfoParameters updateInfoParameters);
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  @override
  Future<UserForm> addUser(AddUserFormParameters addUserFormParameters) async {
    if (!GeneralFun.checkEmailFormat(addUserFormParameters.userForm.email!)) {
      throw const ServerException(
          ErrorMessageModel(statusMessage: 'Email badly formatted'));
    }
    final req =
        addUserFormParameters.userForm.multiPart(AppConstance.addUserUrl);

    req.headers['Accept'] = 'application/json';
    req.headers['Authorization'] = 'Bearer ${addUserFormParameters.token}';
    req.headers['lang'] = 'en';

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return UserForm.fromJson(jsonDecode(res.body)['data']['details']);
    }
    throw const ServerException(
        ErrorMessageModel(statusMessage: 'Email not found'));
  }

  @override
  Future<User> updateInfo(UpdateInfoParameters updateInfoParameters) async {
    final req =
        updateInfoParameters.updateInfo.multiPart(AppConstance.updateInfoUrl);

    req.headers['Accept'] = 'application/json';
    req.headers['Authorization'] = 'Bearer ${updateInfoParameters.token}';
    req.headers['lang'] = 'en';

    final stream = await req.send();
    final res = await http.Response.fromStream(stream);

    if (res.statusCode == 200 || res.statusCode == 201) {
      return User.fromJson(jsonDecode(res.body)['data'],
          token: updateInfoParameters.token);
    }
    throw const ServerException(
        ErrorMessageModel(statusMessage: 'Email not found'));
  }
}
