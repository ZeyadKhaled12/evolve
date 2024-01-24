import 'package:get/get.dart';
import 'package:tdh_event/features/auth/data/parameters/forget_password_parameters.dart';
import 'package:tdh_event/features/auth/data/parameters/set_user_parameters.dart';
import '../../../core/utils/enums.dart';
import '../data/datasource/auth_local_data_source.dart';
import '../data/datasource/auth_remote_data_source.dart';
import '../data/parameters/login_parameters.dart';
import '../data/repository/auth_repo.dart';
import '../models/user/user.dart';

class AuthController extends GetxController {
  BaseAuthRepo baseAuthRepo =
      AuthRepo(AuthRemoteDataSource(), AuthLocalDataSource());
  var requestState = RequestState.loaded.obs;
  var errorMessage = ''.obs;
  var user = const User().obs;
  var forgotPasswordMessage = ''.obs;

  Future<void> login(LoginParameters loginParameters) async {
    requestState.value = RequestState.loading;
    final result = await baseAuthRepo.login(loginParameters);
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) async {
      user.value = r;
      requestState.value = RequestState.loaded;
    });
  }

  Future<void> forgotPassword(
      ForgetPasswordParameters forgetPasswordParameters) async {
    requestState.value = RequestState.loading;
    final result = await baseAuthRepo.forgotPassword(forgetPasswordParameters);
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) async {
      forgotPasswordMessage.value = r;
      requestState.value = RequestState.loaded;
    });
  }

  Future<void> setUser(SetUserParameters setUserParameters) async {
    await baseAuthRepo.setUser(setUserParameters);
  }

  Future<void> checkIfLogin() async {
    requestState.value = RequestState.loading;
    final result = await baseAuthRepo.checkIfLogin();
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) async {
      user.value = r;
      requestState.value = RequestState.loaded;
    });
  }
}
