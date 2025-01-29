import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home_haven_clean/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:home_haven_clean/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:home_haven_clean/features/auth/domain/repositories/auth_repo.dart';
import 'package:home_haven_clean/features/auth/domain/usecases/login_usecase.dart';
import 'package:home_haven_clean/features/auth/domain/usecases/register_usecase.dart';
import 'package:home_haven_clean/features/auth/presentation/controller/auth_provider.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  getIt.registerLazySingleton(
    () => Dio(),
  );
  await authInit();
}

Future<void> authInit() async {
  // TODO registerUsecaseni bu yerda regisgter qilib qo'yinglar
  getIt
    ..registerLazySingleton<LoginUsecase>(() => LoginUsecase(authRepo: getIt()))
    ..registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(authRepo: getIt()),
    )
    ..registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(authRemoteDataSource: getIt()))
    ..registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl())
    ..registerLazySingleton(
      () => AuthProvider(),
    );
}
