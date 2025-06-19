class BankSaveEntityModel {
  String? accountNumber;
  String? bankCode;

  BankSaveEntityModel({this.accountNumber, this.bankCode});

  factory BankSaveEntityModel.fromJson(Map<String, dynamic> json) {
    return BankSaveEntityModel(
      accountNumber: json['account_number']?.toString(),
      bankCode: json['bank_code']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (accountNumber != null) 'account_number': accountNumber,
    if (bankCode != null) 'bank_code': bankCode,
  };
}
