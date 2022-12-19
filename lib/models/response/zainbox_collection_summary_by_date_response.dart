class ZainboxCollectionSummaryByDateResponse {
  String? code;
  List<Data>? data;
  String? description;
  String? status;

  ZainboxCollectionSummaryByDateResponse(
      {this.code, this.data, this.description, this.status});

  ZainboxCollectionSummaryByDateResponse.fromJson(
      Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
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
  int? count;
  String? dateFrom;
  String? dateTo;
  String? total;
  String? transactionType;

  Data(
      {this.count,
        this.dateFrom,
        this.dateTo,
        this.total,
        this.transactionType});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
    total = json['total'];
    transactionType = json['transactionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['dateFrom'] = dateFrom;
    data['dateTo'] = dateTo;
    data['total'] = total;
    data['transactionType'] = transactionType;
    return data;
  }
}
