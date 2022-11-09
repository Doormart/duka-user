class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.price,
    this.like,
    this.productCategoryId,
    this.vendorId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? name;
  String? description;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  int? price;
  int? like;
  int? productCategoryId;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image1: json["image_1"],
    image2: json["image_2"],
    image3: json["image_3"],
    image4: json["image_4"],
    price: json["price"],
    like: json["like"],
    productCategoryId: json["product_category_id"],
    vendorId: json["vendor_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );
}