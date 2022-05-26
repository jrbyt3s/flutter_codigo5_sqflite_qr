class LicenseModel {
  int? id;
  String name;
  String dni;
  String url;

  LicenseModel({
    this.id,
    required this.name,
    required this.dni,
    required this.url,
  });

  factory LicenseModel.fromJson(Map<String, dynamic> json) => LicenseModel(
        id: json["id"],
        name: json["name"],
        dni: json["dni"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dni": dni,
        "url": url,
      };
}
