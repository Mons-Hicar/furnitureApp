// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.categoryId,
    this.subcategoryId,
    this.productName,
    this.description,
    this.dealerPrice,
    this.retailerPrice,
    this.inStock,
    this.availableColors,
    this.availableSizes,
    this.enabled,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.media,
  });

  int id;
  int categoryId;
  int subcategoryId;
  String productName;
  String description;
  String dealerPrice;
  String retailerPrice;
  int inStock;
  String availableColors;
  String availableSizes;
  int enabled;
  DateTime createdAt;
  DateTime updatedAt;
  String image;
  List<Media> media;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        productName: json["product_name"],
        description: json["description"],
        dealerPrice: json["dealer_price"],
        retailerPrice: json["retailer_price"],
        inStock: json["in_stock"],
        availableColors: json["available_colors"],
        availableSizes: json["available_sizes"],
        enabled: json["enabled"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "product_name": productName,
        "description": description,
        "dealer_price": dealerPrice,
        "retailer_price": retailerPrice,
        "in_stock": inStock,
        "available_colors": availableColors,
        "available_sizes": availableSizes,
        "enabled": enabled,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Media {
  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  ModelType modelType;
  int modelId;
  CollectionName collectionName;
  String name;
  String fileName;
  MimeType mimeType;
  Disk disk;
  int size;
  List<dynamic> manipulations;
  List<dynamic> customProperties;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: modelTypeValues.map[json["model_type"]],
        modelId: json["model_id"],
        collectionName: collectionNameValues.map[json["collection_name"]],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        disk: diskValues.map[json["disk"]],
        size: json["size"],
        manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties:
            List<dynamic>.from(json["custom_properties"].map((x) => x)),
        responsiveImages:
            List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelTypeValues.reverse[modelType],
        "model_id": modelId,
        "collection_name": collectionNameValues.reverse[collectionName],
        "name": name,
        "file_name": fileName,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "disk": diskValues.reverse[disk],
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum CollectionName { PRODUCT_IMAGES }

final collectionNameValues =
    EnumValues({"product_images": CollectionName.PRODUCT_IMAGES});

enum Disk { MEDIA }

final diskValues = EnumValues({"media": Disk.MEDIA});

enum MimeType { IMAGE_PNG, IMAGE_JPEG }

final mimeTypeValues = EnumValues(
    {"image/jpeg": MimeType.IMAGE_JPEG, "image/png": MimeType.IMAGE_PNG});

enum ModelType { APP_MODEL_PRODUCT }

final modelTypeValues =
    EnumValues({"App\\Model\\Product": ModelType.APP_MODEL_PRODUCT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
