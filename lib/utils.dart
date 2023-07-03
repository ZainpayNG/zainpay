class Utils {

  static String getBaseUrl(final bool isTest) => isTest ? sandboxBaseURL : liveBaseURL;

  static const sandboxBaseURL = "https://sandbox.zainpay.ng";
  static const liveBaseURL = "https://api.zainpay.ng";

  static const createZainboxUrl = "zainbox/create/request";
  static const getAllZainboxesUrl = "zainbox/list";
  static const getAllZainboxAccountsUrl = "zainbox/virtual-accounts";

  static const createVirtualAccountUrl = "virtual-account/create/request";
  static const updateVirtualAccountStatusUrl = "virtual-account/change/account/status";
  static const zainboxVirtualAccountsBalanceUrl = "zainbox/accounts/balance";
  static const virtualAccountBalanceUrl = "zainbox/virtual-account/wallet/balance";
  static const bankListUrl = "bank/list";
  static const accountNameUrl = "zainbox/bank/name-enquiry";
  static const transferUrl = "zainbox/bank/transfer";
  static const createSettlement = "zainbox/settlement";
  static const initializePayment = "zainbox/card/initialize/payment";
  static const virtualAccountTransactionsUrl = "virtual-account/wallet/transactions";
  static const transactionVerificationUrl = "virtual-account/wallet/transaction/verify";
  static const depositVerificationUrl = "virtual-account/wallet/deposit/verify/v2";
  static const zainboxTransactionHistoryUrl = "zainbox/transactions";
  static const zainboxCollectionSummaryByDateUrl = "zainbox/transfer/deposit/summary";
  static const zainboxProfileUrl = "zainbox/profile";
  static const merchantTransactionsUrl = "zainbox/transactions";

}