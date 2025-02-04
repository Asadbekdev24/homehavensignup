import 'package:dartz/dartz.dart';
import 'package:home_haven_clean/features/home/domain/entities/banner_entity.dart';
import 'package:home_haven_clean/features/home/domain/entities/product_entity.dart';
import 'package:home_haven_clean/features/home/domain/repositories/home_repo.dart';

class GetProductsUsecase {

  final HomeRepo homeRepo;

  GetProductsUsecase({required this.homeRepo});



  Future<Either<dynamic, ProductEntity>> callProduct() async{
    return await homeRepo.getProducts();
  }
}