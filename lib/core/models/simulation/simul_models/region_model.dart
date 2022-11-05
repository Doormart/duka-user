class RegionModel{

  int? id;
  String? region;

  RegionModel({
    this.id,
    this.region,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    id: json["id"],
    region: json["region"],
  );

}