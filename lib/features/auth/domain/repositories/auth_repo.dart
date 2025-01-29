import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<dynamic, bool>> login({
    required String phoneNumber,
    required String password,
  });

  Future<Either<dynamic, bool>> register({
    required String phoneNumber,
    required String email,
    required String password,
  });
}
