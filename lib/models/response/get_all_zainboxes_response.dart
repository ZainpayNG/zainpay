class GetAllZainboxesResponse {
  String? code;
  List<Data>? data;
  String? description;
  String? status;

  GetAllZainboxesResponse({
    this.code,
    this.data,
    this.description,
    this.status
  });

  GetAllZainboxesResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) => data!.add(Data.fromJson(v)));
    }
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? callbackUrl;
  String? codeName;
  String? name;
  String? tags;

  Data({this.callbackUrl, this.codeName, this.name, this.tags});

  Data.fromJson(Map<String, dynamic> json) {
    callbackUrl = json['callbackUrl'];
    codeName = json['codeName'];
    name = json['name'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['callbackUrl'] = callbackUrl;
    data['codeName'] = codeName;
    data['name'] = name;
    data['tags'] = tags;
    return data;
  }
}