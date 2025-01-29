import 'package:dartz/dartz.dart';
import 'package:home_haven_clean/features/auth/domain/repositories/auth_repo.dart';

class RegisterUsecase {
  final AuthRepo authRepo;

  RegisterUsecase({required this.authRepo});

  Future<Either<dynamic, bool>> call({
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    return await authRepo.register(
      phoneNumber: phoneNumber,
      email: email,
      password: password,
    );
  }
}
