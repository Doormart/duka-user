class RegionModel{

  int id;
  String region;

  RegionModel({
    required this.id,
    required this.region,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    id: json["id"],
    region: json["region"],
  );

}