import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:home_haven_clean/core/common/app/services/injcetion_container.dart';
import 'package:home_haven_clean/features/home/domain/entities/banner_entity.dart';
import 'package:home_haven_clean/features/home/domain/entities/product_entity.dart';
import 'package:home_haven_clean/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:home_haven_clean/features/home/domain/usecases/get_products_usecase.dart';

class HomeProvider extends ChangeNotifier {
  final bannerUseCase = getIt<GetBannersUsecase>();
  final productUseCase=getIt<GetProductsUsecase>();

  bool isLoading = false;
  BannerEntity? banners = BannerEntity();
  ProductEntity? products=ProductEntity();
  String? message;

  Future<void> getBanners() async {
    log("Get abnners called in provider");
    isLoading = true;
    notifyListeners();
    final result = await bannerUseCase.call();
    result.fold(
      (l) => message = l,
      (r) => banners = r,
    );
    log(banners!.data.toString());
    isLoading = false;
    notifyListeners();
  }

  Future<void> getProducts() async{

    log("Get abnners called in provider");
    isLoading=true;
    notifyListeners();
    final javob=await productUseCase.callProduct();

     javob.fold((l) => message=l, (r) => products=r);

     log(products!.data.toString());
     isLoading=false;
     notifyListeners();

  }
}
