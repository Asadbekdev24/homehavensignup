import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home_haven_clean/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:home_haven_clean/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:home_haven_clean/features/auth/domain/repositories/auth_repo.dart';
import 'package:home_haven_clean/features/auth/domain/usecases/login_usecase.dart';
import 'package:home_haven_clean/features/auth/domain/usecases/register_usecase.dart';
import 'package:home_haven_clean/features/auth/presentation/controller/auth_provider.dart';
import 'package:home_haven_clean/features/home/data/datasource/home_remote_data_source.dart';
import 'package:home_haven_clean/features/home/data/repositories/home_repo_impl.dart';
import 'package:home_haven_clean/features/home/domain/repositories/home_repo.dart';
import 'package:home_haven_clean/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:home_haven_clean/features/home/domain/usecases/get_products_usecase.dart';
import 'package:home_haven_clean/features/home/presentation/controllers/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  getIt.registerLazySingleton(
    () => Dio(),
  );
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  await authInit();
  await homeInit();
}

Future<void> authInit() async {
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

// home
Future<void> homeInit() async {
  getIt
    ..registerLazySingleton(() => GetBannersUsecase(homeRepo: getIt()))
    ..registerLazySingleton(
      () => GetProductsUsecase(homeRepo: getIt()),
    )
    ..registerLazySingleton<HomeRepo>(
        () => HomeRepoImpl(homeRemoteDataSource: getIt()))
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(),
    )
    ..registerLazySingleton<HomeProvider>(
      () => HomeProvider(),
    );
}
