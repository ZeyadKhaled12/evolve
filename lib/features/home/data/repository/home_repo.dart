import 'package:either_dart/either.dart';
import 'package:tdh_event/features/auth/models/user/user.dart';
import 'package:tdh_event/features/home/data/parameters/update_info_parameters.dart';

import '../../../../core/network/exception.dart';
import '../../../../core/network/failure.dart';
import '../../models/user_form.dart';
import '../datasource/home_local_data_source.dart';
import '../datasource/home_remote_data_sorce.dart';
import '../parameters/add_user_form_parameters.dart';

abstract class BaseHomeRepo {
  Future<Either<Failure, List<UserForm>>> getUsers();
  Future<void> setUserLocal(User user);
  Future<Either<Failure, List<UserForm>>> setUsers(UserForm userModel);
  Future<Either<Failure, UserForm>> addUserForm(
      AddUserFormParameters addUserFormParameters);
  Future<Either<Failure, User>> updateUser(
      UpdateInfoParameters updateInfoParameters);
  Future<void> setUserNoConnection(UserForm userForm);
  Future<void> clearUserNoConnection();
  Future<Either<Failure, void>> logout();
  Future<List<UserForm>> getUsersNoConnection();
}

class HomeRepo extends BaseHomeRepo {
  final BaseHomeLocalDataSource baseHomeLocalDataSource;
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepo(this.baseHomeRemoteDataSource, this.baseHomeLocalDataSource);

  @override
  Future<Either<Failure, List<UserForm>>> getUsers() async {
    try {
      final result = await baseHomeLocalDataSource.getUsers();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<UserForm>>> setUsers(UserForm userModel) async {
    try {
      final result = await baseHomeLocalDataSource.setUsers(userModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await baseHomeLocalDataSource.logOut();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserForm>> addUserForm(
      AddUserFormParameters addUserFormParameters) async {
    try {
      final result =
          await baseHomeRemoteDataSource.addUser(addUserFormParameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(
      UpdateInfoParameters updateInfoParameters) async {
    try {
      final result =
          await baseHomeRemoteDataSource.updateInfo(updateInfoParameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<void> setUserLocal(User user) async {
    await baseHomeLocalDataSource.setUserLocal(user);
  }

  @override
  Future<void> setUserNoConnection(UserForm userForm) async {
    await baseHomeLocalDataSource.setUserNoConnection(userForm);
  }

  @override
  Future<void> clearUserNoConnection() async {
    await baseHomeLocalDataSource.clearUserNoConnection();
  }

  @override
  Future<List<UserForm>> getUsersNoConnection() async {
    return await baseHomeLocalDataSource.getUsersNoConnection();
  }
}
