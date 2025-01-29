import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:home_haven_clean/core/common/exceptions/custom_exception.dart';

import 'package:home_haven_clean/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:home_haven_clean/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<Either<dynamic, bool>> login({
    required String phoneNumber,
    required String password,
  }) async {
    log("data in repo impl: $phoneNumber, $password");
    try {
      final bool = await authRemoteDataSource.login(
        phoneNumber: phoneNumber,
        password: password,
      );
      return Right(bool ?? false);
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }

  @override
  Future<Either<dynamic, bool>> register({
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      final bool = await authRemoteDataSource.register(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      );
      return Right(bool!);
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }
}
