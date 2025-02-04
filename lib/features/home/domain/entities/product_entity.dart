import 'package:home_haven_clean/features/home/domain/entities/product_entity.dart';

import 'product_entity.dart';

class ProductEntity {
    List<ProductDataEntity>? data;
    PaginationEntity? paginationEntity;

    ProductEntity({
         this.data,
         this.paginationEntity,
    });

}

class ProductDataEntity {
    String id;
    String name;
    String description;
    String shortDescription;
    String icon;
    List<String> image;
    int quintity;
    double price;
    int discount;
    double rating;
    int ratingCount;
    ColorsEntity colorsEntity;
    SizeEntity sizeEntity;
    String category;

    ProductDataEntity({
        required this.id,
        required this.name,
        required this.description,
        required this.shortDescription,
        required this.icon,
        required this.image,
        required this.quintity,
        required this.price,
        required this.discount,
        required this.rating,
        required this.ratingCount,
        required this.colorsEntity,
        required this.sizeEntity,
        required this.category,
    });

}

class ColorsEntity {
    String name;
    String colorHexFlutter;

    ColorsEntity({
        required this.name,
        required this.colorHexFlutter,
    });

}

class SizeEntity {
    int width;
    int depth;
    int heigth;
    int seatWidth;
    int seatDepth;
    int seatHeigth;

    SizeEntity({
        required this.width,
        required this.depth,
        required this.heigth,
        required this.seatWidth,
        required this.seatDepth,
        required this.seatHeigth,
    });

}

class PaginationEntity {
    int? totalRecords;
    int? currentPage;
    int? totalPages;
    dynamic nextPage;
    dynamic prevPage;

    PaginationEntity({
         this.totalRecords,
         this.currentPage,
         this.totalPages,
         this.nextPage,
         this.prevPage,
    });

}
