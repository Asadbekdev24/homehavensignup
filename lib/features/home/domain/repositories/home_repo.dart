import 'package:dartz/dartz.dart';
import 'package:home_haven_clean/features/home/domain/entities/banner_entity.dart';
import 'package:home_haven_clean/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<dynamic, BannerEntity>> getBanners();
  Future<Either<dynamic, ProductEntity>> getProducts();
}
