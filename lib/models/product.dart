// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String id;
    String name;
    int price;
    String description;
    String category;
    String categoryDisplay;
    String thumbnail;
    bool isFeatured;
    int stock;
    String brand;
    int userId;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.categoryDisplay,
        required this.thumbnail,
        required this.isFeatured,
        required this.stock,
        required this.brand,
        required this.userId,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        categoryDisplay: json["category_display"],
        thumbnail: json["thumbnail"],
        isFeatured: json["is_featured"],
        stock: json["stock"],
        brand: json["brand"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "category_display": categoryDisplay,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "stock": stock,
        "brand": brand,
        "user_id": userId,
    };
}
