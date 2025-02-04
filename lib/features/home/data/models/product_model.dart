import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';
@JsonSerializable()
class ProducModel {
    @JsonKey(name: "data")
    List<Datum> data;
    @JsonKey(name: "pagination")
    Pagination pagination;

    ProducModel({
        required this.data,
        required this.pagination,
    });

    factory ProducModel.fromJson(Map<String, dynamic> json) => _$ProducModelFromJson(json);

    Map<String, dynamic> toJson() => _$ProducModelToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "_id")
    String id;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "description")
    String description;
    @JsonKey(name: "short_description")
    String shortDescription;
    @JsonKey(name: "icon")
    String icon;
    @JsonKey(name: "image")
    List<String> image;
    @JsonKey(name: "quintity")
    int quintity;
    @JsonKey(name: "price")
    double price;
    @JsonKey(name: "discount")
    int discount;
    @JsonKey(name: "rating")
    double rating;
    @JsonKey(name: "rating_count")
    int ratingCount;
    @JsonKey(name: "colors")
    Colors colors;
    @JsonKey(name: "size")
    Size size;
    @JsonKey(name: "category")
    String category;

    Datum({
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
        required this.colors,
        required this.size,
        required this.category,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Colors {
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "color_hex_flutter")
    String colorHexFlutter;

    Colors({
        required this.name,
        required this.colorHexFlutter,
    });

    factory Colors.fromJson(Map<String, dynamic> json) => _$ColorsFromJson(json);

    Map<String, dynamic> toJson() => _$ColorsToJson(this);
}

@JsonSerializable()
class Size {
    @JsonKey(name: "width")
    int width;
    @JsonKey(name: "depth")
    int depth;
    @JsonKey(name: "heigth")
    int heigth;
    @JsonKey(name: "seat_width")
    int seatWidth;
    @JsonKey(name: "seat_depth")
    int seatDepth;
    @JsonKey(name: "seat_heigth")
    int seatHeigth;

    Size({
        required this.width,
        required this.depth,
        required this.heigth,
        required this.seatWidth,
        required this.seatDepth,
        required this.seatHeigth,
    });

    factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

    Map<String, dynamic> toJson() => _$SizeToJson(this);
}

@JsonSerializable()
class Pagination {
    @JsonKey(name: "total_records")
    int totalRecords;
    @JsonKey(name: "current_page")
    int currentPage;
    @JsonKey(name: "total_pages")
    int totalPages;
    @JsonKey(name: "next_page")
    dynamic nextPage;
    @JsonKey(name: "prev_page")
    dynamic prevPage;

    Pagination({
        required this.totalRecords,
        required this.currentPage,
        required this.totalPages,
        required this.nextPage,
        required this.prevPage,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

    Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
