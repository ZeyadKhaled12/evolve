import 'package:get/get.dart';
import '../../../core/utils/enums.dart';
import '../../auth/models/user/user.dart';
import '../data/datasource/home_local_data_source.dart';
import '../data/datasource/home_remote_data_sorce.dart';
import '../data/parameters/add_user_form_parameters.dart';
import '../data/parameters/update_info_parameters.dart';
import '../data/repository/home_repo.dart';
import '../models/user_form.dart';

class HomeController extends GetxController {
  BaseHomeRepo baseHomeRepo =
      HomeRepo(HomeRemoteDataSource(), HomeLocalDataSource());
  var requestState = RequestState.loaded.obs;
  var errorMessage = ''.obs;
  var user = const User().obs;
  var users = <UserForm>[].obs;
  var internetConnection = true.obs;

  void setUser(User user) {
    this.user.value = user;
  }

  Future<void> setUserNoConnection(UserForm userForm) async {
    requestState.value = RequestState.loading;
    await baseHomeRepo.setUserNoConnection(userForm);
    requestState.value = RequestState.loaded;
  }

  Future<void> clearConnectionUsers(String token) async {
    final List<UserForm> users = await baseHomeRepo.getUsersNoConnection();
    for (var element in users) {
      await addUserForm(AddUserFormParameters(userForm: element, token: token));
    }
    await baseHomeRepo.clearUserNoConnection();
    requestState.value = RequestState.loaded;
  }

  Future<void> setUserLocal(User user) async {
    await baseHomeRepo.setUserLocal(user);
  }

  Future<void> getUsers() async {
    requestState.value = RequestState.loading;
    final result = await baseHomeRepo.getUsers();
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) {
      users.value = r;
      requestState.value = RequestState.loaded;
    });
  }

  Future<void> updateUser(UpdateInfoParameters updateInfoParameters) async {
    requestState.value = RequestState.loading;
    final result = await baseHomeRepo.updateUser(updateInfoParameters);
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) {
      user.value = r;
      setUserLocal(user.value);
      requestState.value = RequestState.loaded;
    });
  }

  Future<void> addUserForm(AddUserFormParameters addUserFormParameters) async {
    final result = await baseHomeRepo.addUserForm(addUserFormParameters);
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) {
      requestState.value = RequestState.loaded;
    });
  }

  Future<void> logout() async {
    requestState.value = RequestState.loading;
    await baseHomeRepo.logout();
    requestState.value = RequestState.loaded;
  }

  Future<void> setUsers(AddUserFormParameters addUserFormParameters) async {
    requestState.value = RequestState.loading;
    final result = await baseHomeRepo.setUsers(addUserFormParameters.userForm);
    result.fold((l) {
      requestState.value = RequestState.error;
      errorMessage.value = l.message;
    }, (r) async {
      users.value = r;
      if (internetConnection.value) {
        addUserForm(addUserFormParameters);
      } else {
        await setUserNoConnection(addUserFormParameters.userForm);
        requestState.value = RequestState.loaded;
      }
    });
  }
}
