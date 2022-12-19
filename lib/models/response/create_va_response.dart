class CreateVirtualAccountResponse {

  CreateVirtualAccountResponse({
    this.accountName,
    this.accountNumber,
    this.bankName,
    this.email
  });

  String? accountName;
  String? accountNumber;
  String? bankName;
  String? email;

  CreateVirtualAccountResponse.fromJson(Map<String, dynamic> json){
    accountName = json['data']['accountName'];
    accountNumber = json['data']['accountNumber'];
    bankName = json['data']['bankName'];
    email = json['data']['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accountName'] = accountName;
    data['accountNumber'] = accountNumber;
    data['bankName'] = bankName;
    data['email'] = email;
    return data;
  }
}