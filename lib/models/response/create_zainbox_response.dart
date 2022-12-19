class CreateZainboxResponse {

  String? status;
  String? description;
  Data? data;

  CreateZainboxResponse({
    this.status,
    this.description,
    this.data
  });

  CreateZainboxResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? codeName;
  String? name;

  Data({required this.codeName, required this.name});

  Data.fromJson(Map<String, dynamic> json) {
    codeName = json['codeName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['codeName'] = codeName;
    data['name'] = name;
    return data;
  }
}
