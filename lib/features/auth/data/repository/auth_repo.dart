import 'package:either_dart/either.dart';
import '../../../../core/network/exception.dart';
import '../../../../core/network/failure.dart';
import '../../models/user/user.dart';
import '../datasource/auth_local_data_source.dart';
import '../datasource/auth_remote_data_source.dart';
import '../parameters/forget_password_parameters.dart';
import '../parameters/login_parameters.dart';
import '../parameters/set_user_parameters.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure, User>> login(LoginParameters loginParameters);
  Future<Either<Failure, String>> forgotPassword(
      ForgetPasswordParameters forgetPasswordParameters);
  Future<Either<Failure, User>> checkIfLogin();
  Future<void> setUser(SetUserParameters setUserParameters);
}

class AuthRepo extends BaseAuthRepo {
  final BaseAuthLocalDataSource baseAuthLocalDataSource;
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepo(this.baseAuthRemoteDataSource, this.baseAuthLocalDataSource);
  @override
  Future<Either<Failure, User>> login(LoginParameters loginParameters) async {
    try {
      final result = await baseAuthRemoteDataSource.login(loginParameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(
      ForgetPasswordParameters forgetPasswordParameters) async {
    try {
      final result = await baseAuthRemoteDataSource
          .forgotPassword(forgetPasswordParameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<void> setUser(SetUserParameters setUserParameters) async {
    return await baseAuthLocalDataSource.setLogin(setUserParameters);
  }

  @override
  Future<Either<Failure, User>> checkIfLogin() async {
    try {
      final result = await baseAuthLocalDataSource.checkIfLogin();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
