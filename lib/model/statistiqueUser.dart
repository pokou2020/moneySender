class StatistiqueUserModel {
  int? totalTransactions;
  double? totalAmount;
  double? totalFee;
  int? totalTransactionSuccess;
  double? totalAmountSuccess;
  int? totalTransactionPending;
  double? totalAmountPending;
  int? totalTransactionFailed;
  double? totalAmountFailed;

  StatistiqueUserModel(
      {this.totalTransactions,
      this.totalAmount,
      this.totalFee,
      this.totalTransactionSuccess,
      this.totalAmountSuccess,
      this.totalTransactionPending,
      this.totalAmountPending,
      this.totalTransactionFailed,
      this.totalAmountFailed});

  StatistiqueUserModel.fromJson(Map<String, dynamic> json) {
    totalTransactions = json['total_transactions'];
    totalAmount = json['total_amount'];
    totalFee = json['total_fee'];
    totalTransactionSuccess = json['total_transaction_success'];
    totalAmountSuccess = json['total_amount_success'];
    totalTransactionPending = json['total_transaction_pending'];
    totalAmountPending = json['total_amount_pending'];
    totalTransactionFailed = json['total_transaction_failed'];
    totalAmountFailed = json['total_amount_failed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_transactions'] = this.totalTransactions;
    data['total_amount'] = this.totalAmount;
    data['total_fee'] = this.totalFee;
    data['total_transaction_success'] = this.totalTransactionSuccess;
    data['total_amount_success'] = this.totalAmountSuccess;
    data['total_transaction_pending'] = this.totalTransactionPending;
    data['total_amount_pending'] = this.totalAmountPending;
    data['total_transaction_failed'] = this.totalTransactionFailed;
    data['total_amount_failed'] = this.totalAmountFailed;
    return data;
  }
}
