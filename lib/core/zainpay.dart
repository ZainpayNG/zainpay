import 'package:flutter/material.dart';
import 'package:zainpay/models/request/initialize_card_payment_request.dart';
import 'package:zainpay/models/response/initialize_card_payment_response.dart';
import '/models/request/create_settlement_request.dart';
import '/models/request/create_va_request.dart';
import '/models/request/create_zainbox_request.dart';
import '/models/request/fund_transfer_request.dart';
import '/models/request/get_account_name_request.dart';
import '/models/request/get_all_zainboxes_request.dart';
import '/models/request/get_bank_list_request.dart';
import '/models/request/get_va_balance_request.dart';
import '/models/request/get_va_transactions_request.dart';
import '/models/request/get_zainbox_collection_summary_by_date_request.dart';
import '/models/request/get_zainbox_vas_balances_request.dart';
import '/models/request/update_va_status_request.dart';
import '/models/request/zainbox_transactions_request.dart';
import '/models/response/account_name_response.dart';
import '/models/response/bank_list_response.dart';
import '/models/response/create_settlement_response.dart';
import '/models/response/create_va_response.dart';
import '/models/response/deposit_verification_response.dart';
import '/models/response/fund_transfer_response.dart';
import '/models/response/get_all_zainbox_accounts_response.dart';
import '/models/response/get_all_zainboxes_response.dart';
import '/models/response/transfer_verification_response.dart';
import '/models/response/update_va_status_response.dart';
import '/models/response/va_balance_response.dart';
import '/models/response/va_transactions_response.dart';
import '/models/response/zainbox_collection_summary_by_date_response.dart';
import '/models/response/zainbox_transaction_history_response.dart';
import '/models/response/zainbox_va_balances_response.dart';

import '../models/request/deposit_verification_request.dart';
import '../models/request/get_all_zainbox_va_request.dart';
import '../models/request/transfer_verification_request.dart';
import '../models/response/create_zainbox_response.dart';

class Zainpay {

  final BuildContext context;
  final String publicKey;
  final bool isTest;

  const Zainpay({
    required this.context,
    required this.publicKey,
    required this.isTest,
  });

  Future<CreateZainboxResponse?> createZainbox(name, tags, callbackUrl, email) async {
    CreateZainboxRequest createZainboxRequest = CreateZainboxRequest(
        name: name,
        tags: tags,
        callbackUrl: callbackUrl,
        email: email,
        publicKey: publicKey,
        isTest: isTest
    );

    return await createZainboxRequest.createZainbox();
  }

  Future<CardPaymentResponse?> initializeCardPayment(amount, txnRef, mobileNumber,
      zainboxCode, email, callbackUrl) async {
    CardPaymentRequest createZainboxRequest = CardPaymentRequest(
        txnRef: txnRef,
        amount: amount,
        mobileNumber: mobileNumber,
        zainboxCode: zainboxCode,
        emailAddress: email,
        callBackUrl: callbackUrl,
        publicKey: publicKey,
        isTest: isTest
    );

    return await createZainboxRequest.initializeCardPayment();
  }

  Future<GetAllZainboxesResponse?> getAllZainboxes() async {
    GetAllZainboxesRequest getAllZainboxesRequest = GetAllZainboxesRequest(
        isTest: isTest,
      publicKey: publicKey
    );

    return await getAllZainboxesRequest.getAllZainboxes();
  }

  Future<ZainboxAccountResponse?> getAllZainboxAccounts(zainboxCodeName) async {
    GetAllZainboxAccountsRequest getAllZainboxAccountsRequest = GetAllZainboxAccountsRequest(
        zainboxCodeName: zainboxCodeName,
        publicKey: publicKey,
        isTest: isTest
    );

    return getAllZainboxAccountsRequest.getAllZainboxAccounts();
  }

  Future<VirtualAccountBalanceResponse?> getVirtualAccountBalance(accountNumber) async {
    GetVirtualAccountBalanceRequest getVirtualAccountBalanceRequest = GetVirtualAccountBalanceRequest(
        accountNumber: accountNumber,
        publicKey: publicKey,
        isTest: isTest
    );

    return getVirtualAccountBalanceRequest.getVirtualAccountBalance();
  }

  Future<ZainboxVirtualAccountsBalancesResponse?> getZainboxVirtualAccountBalance(zainboxCode) async {
    GetZainboxVirtualAccountsBalancesRequest getZainboxVirtualAccountsBalancesRequest = GetZainboxVirtualAccountsBalancesRequest(
        zainboxCode: zainboxCode,
        publicKey: publicKey,
        isTest: isTest
    );

    return getZainboxVirtualAccountsBalancesRequest.getZainboxVirtualAccountsBalances();
  }

  Future<VirtualAccountTransactionsResponse?> getVirtualAccountTransactions(accountNumber) async {
    GetVirtualAccountTransactionsRequest getVirtualAccountTransactionsRequest = GetVirtualAccountTransactionsRequest(
        accountNumber: accountNumber,
        publicKey: publicKey,
        isTest: isTest
    );

    return getVirtualAccountTransactionsRequest.getVirtualAccountTransactions();
  }

  Future<BankListResponse?> getBankList() async {
    GetBankListRequest getBankListRequest = GetBankListRequest(
        publicKey: publicKey,
        isTest: isTest
    );

    return getBankListRequest.getBankListRequest();
  }

  Future<AccountNameResponse?> getAccountName(bankCode, accountNumber) async {
    AccountNameRequest accountNameRequest = AccountNameRequest(
        accountNumber: accountNumber,
        bankCode: bankCode,
        publicKey: publicKey,
        isTest: isTest
    );

    return accountNameRequest.getAccountName();
  }

  Future<TransferVerificationResponse?> verifyTransfer(txnRef) async {
    TransferVerificationRequest transferVerificationRequest = TransferVerificationRequest(
        txnRef: txnRef,
        publicKey: publicKey,
        isTest: isTest
    );

    return transferVerificationRequest.verifyTransfer();
  }

  Future<DepositVerificationResponse?> verifyDeposit(txnRef) async {
    DepositVerificationRequest depositVerificationRequest = DepositVerificationRequest(
        txnRef: txnRef,
        publicKey: publicKey,
        isTest: isTest
    );

    return depositVerificationRequest.verifyDeposit();
  }

  Future<ZainboxTransactionHistoryResponse?> getZainboxTransactionHistory(zainboxCode) async {
    ZainboxTransactionsRequest zainboxTransactionsRequest = ZainboxTransactionsRequest(
        zainboxCode: zainboxCode,
        publicKey: publicKey,
        isTest: isTest
    );

    return zainboxTransactionsRequest.getZainboxTransactionsHistory();
  }

  Future<ZainboxCollectionSummaryByDateResponse?> getZainboxCollectionSummaryByDate(zainboxCode, {dateFrom, dateTo}) async {
    ZainboxCollectionSummaryByDateRequest zainboxCollectionSummaryByDateRequest = ZainboxCollectionSummaryByDateRequest(
        zainboxCode: zainboxCode,
        publicKey: publicKey,
        isTest: isTest
    );

    return zainboxCollectionSummaryByDateRequest.getSummary();
  }

  Future<CreateVirtualAccountResponse?> createVirtualAccount(fullName, email,
      mobileNumber, zainboxCode) async {
    CreateVirtualAccountRequest createVirtualAccountRequest = CreateVirtualAccountRequest(
        email: email,
        mobileNumber: mobileNumber,
        zainboxCode: zainboxCode,
        fullName: fullName,
        publicKey: publicKey,
        isTest: isTest
    );

    return await createVirtualAccountRequest.createVirtualAccount();
  }

  Future<CreateSettlementResponse?> createSettlement(name, scheduleType, schedulePeriod,
      settlementList, status, zainboxCode) async {
    CreateSettlementRequest createSettlementRequest = CreateSettlementRequest(
        name: name,
        zainboxCode: zainboxCode,
        scheduleType: scheduleType,
        schedulePeriod: schedulePeriod,
        settlementAccountList: settlementList,
        status: status,
        publicKey: publicKey,
        isTest: isTest
    );

    return await createSettlementRequest.createSettlement();
  }

  Future<FundTransferResponse?> transferFund(destinationAccountNumber, destinationBankCode,
      amount, txnRef, narration, sourceAccountNumber, sourceBankCode, zainboxCode) async {
    FundTransferRequest fundTransferRequest = FundTransferRequest(
        destinationAccountNumber: destinationAccountNumber,
        destinationBankCode: destinationBankCode,
        amount: amount,
        sourceAccountNumber: sourceAccountNumber,
        sourceBankCode: sourceBankCode,
        zainboxCode: zainboxCode,
        txnRef: txnRef,
        narration: narration,
        publicKey: publicKey,
        isTest: isTest
    );

    return await fundTransferRequest.transferFund();
  }

  Future<UpdateVirtualAccountStatusResponse?> updateVirtualAccountStatus(status,
      accountNumber, zainboxCode) async {
    UpdateVirtualAccountStatusRequest updateVirtualAccountStatusRequest = UpdateVirtualAccountStatusRequest(
        accountNumber: accountNumber,
        status: status,
        zainboxCode: zainboxCode,
        publicKey: publicKey,
        isTest: isTest
    );

    return await updateVirtualAccountStatusRequest.updateVirtualAccountStatus();
  }
}