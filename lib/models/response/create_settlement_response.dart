class CreateSettlementResponse {
  String? name;
  String? scheduleType;
  String? schedulePeriod;
  String? zainboxCode;
  bool? status;

  CreateSettlementResponse(
      {this.name,
        this.scheduleType,
        this.schedulePeriod,
        this.zainboxCode,
        this.status
      });

  CreateSettlementResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    scheduleType = json['scheduleType'];
    schedulePeriod = json['schedulePeriod'];
    zainboxCode = json['zainboxCode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['scheduleType'] = scheduleType;
    data['schedulePeriod'] = schedulePeriod;
    data['zainboxCode'] = zainboxCode;
    data['status'] = status;
    return data;
  }
}
