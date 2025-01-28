import 'dart:developer';

import 'package:home_haven_clean/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:home_haven_clean/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<bool> login({
    required String phoneNumber,
    required String password,
  }) async {
    log("data in repo impl: $phoneNumber, $password");

    return await authRemoteDataSource.login(
      phoneNumber: phoneNumber,
      password: password,
    );
  }

  //  TODO 3 domain layerdagi repositoryni sign up methodini override qiling.
}
