class DataModel {
  final String name;
  final String role;

  DataModel({required this.name, required this.role});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['result']['data'][0]['createdBy']['name'],
      role: json['result']['data'][0]['createdBy']['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
    };
  }
}
