

import 'package:home_haven_clean/features/home/data/models/banner_model.dart';
import 'package:home_haven_clean/features/home/data/models/product_model.dart';
import 'package:home_haven_clean/features/home/domain/entities/product_entity.dart';


class ProductMapper {

  static ProductEntity mapProductEntity(ProducModel? model)
  {
    return ProductEntity(
      data: model?.data?.map((e) => mapProductData(e)).toList(),
      paginationEntity:mapPaginationData(model?.pagination),

    );

  }


  // product data

  static ProductDataEntity  mapProductData(Datum model)
  {
    return ProductDataEntity(id: model.id, name: model.name, description: model.description, shortDescription: model.shortDescription, icon: model.icon, image: model.image, quintity: model.quintity, price: model.price, discount: model.price.toInt(), rating: model.rating, ratingCount: model.ratingCount, colorsEntity: mapProductColor(model.colors), sizeEntity: mapProductSize(model.size), category: model.category);
  }


  static PaginationEntity mapPaginationData(Pagination? model)
  {
     return PaginationEntity(totalRecords: model?.totalRecords, currentPage: model?.currentPage, totalPages: model?.totalPages, nextPage: model?.nextPage, prevPage: model?.prevPage);
  }

  static ColorsEntity mapProductColor(Colors colors)
  {
    return ColorsEntity(name: colors.name, colorHexFlutter: colors.colorHexFlutter);
  }

  static SizeEntity mapProductSize(Size size)
  {
    return SizeEntity(width: size.width, depth: size.depth, heigth: size.heigth, seatWidth: size.seatWidth, seatDepth: size.seatDepth, seatHeigth: size.seatHeigth);
  }


}
