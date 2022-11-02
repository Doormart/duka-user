class Vendor {
  Vendor({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.adminVerified,
    this.phone,
    this.companyProof,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.publicImage,
    this.status,
    this.address,
    this.minOrder,
    this.prepareTime,
    this.accountNumber,
    this.rating,
    this.regionId,
    this.latitude,
    this.longitude,
  });

  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  int? adminVerified;
  String? phone;
  String? companyProof;
  int? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? publicImage;
  String? status;
  String? address;
  String? minOrder;
  String? prepareTime;
  String? accountNumber;
  int? rating;
  int? regionId;
  String? latitude;
  String? longitude;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: DateTime.tryParse(json["email_verified_at"]),
    adminVerified: json["admin_verified"],
    phone: json["phone"],
    companyProof: json["company_proof"],
    categoryId: json["category_id"],
    createdAt: DateTime.tryParse(json["created_at"]),
    updatedAt: DateTime.tryParse(json["updated_at"]),
    publicImage: json["public_image"],
    status: json["status"],
    address: json["address"],
    minOrder: json["min_order"],
    prepareTime: json["prepare_time"],
    accountNumber: json["account_number"],
    rating: json["rating"],
    regionId: json["region_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );
}