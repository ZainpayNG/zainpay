<p align="center">  
   <img title="Zainpay" height="100" src="https://raw.githubusercontent.com/itcglobal/zainpay/main/zainpay.png" width="50%"/>
</p>  

# Zainpay Flutter Package

The Flutter library helps you create seamless payment experiences in your flutter mobile app.

## Table of Contents

1. [Requirements](#requirements)
2. [Installation](#installation)
3. [Usage](#usage)
4. [License](#License)

## Requirements

1. Zainpay Account [API Keys](https://zainpay.ng)
2. Supported Flutter version >= 1.17.0

## Installation

1. Add the dependency to your project. In your `pubspec.yaml`, file add: `zainpay: 0.1.22`.
2. Run `flutter pub get`.

## Usage

### Initializing a Zainpay instance

To create an instance, you should call the Zainpay constructor. This constructor accepts a mandatory instance of the following:

-  `context`
-  `publicKey`
-  `isTest`

It returns an instance of Zainpay which we then call the async methods on for every feature requested.

        final Zainpay zainpay = Zainpay(
            context: context,
            publicKey: getPublicKey(),
            isTest: true
        );

### Handling the response

Calling the `createZainbox(name, tags, callbackUrl, email)` method returns a Future of `CreateZainboxResponse?` which we await for the actual response as seen above.

    final CreateZainboxResponse? response = await zainpay.createZainbox(name, tags, callbackUrl, email);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `updateZainbox(zainboxCode, name[optional], tags[optional], callbackUrl[optional], email[optional])` method returns a Future of `CreateZainboxResponse?` which we await for the actual response as seen above.

    final CreateZainboxResponse? response = await zainpay.updateZainbox(zainboxCode, name, tags, callbackUrl, email);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `getAllZainboxes()` method returns a Future of `GetAllZainboxesResponse?` which we await for the actual response as seen above.

    final GetAllZainboxesResponse? response = await zainpay.getAllZainboxes();

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `getAllZainboxAccounts(zainboxCodeName)` method returns a Future of `ZainboxAccountResponse?` which we await for the actual response as seen above.

    final ZainboxAccountResponse? response = await zainpay.getAllZainboxAccounts(zainboxCodeName);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `getVirtualAccountBalance(accountNumber)` method returns a Future of `VirtualAccountBalanceResponse?` which we await for the actual response as seen above.

    final VirtualAccountBalanceResponse? response = await zainpay.getVirtualAccountBalance(accountNumber);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `getZainboxVirtualAccountBalance(zainboxCode)` method returns a Future of `ZainboxVirtualAccountsBalancesResponse?` which we await for the actual response as seen above.

    final ZainboxVirtualAccountsBalancesResponse? response = await zainpay.getZainboxVirtualAccountBalance(zainboxCode);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `getVirtualAccountTransactions(accountNumber, count[optional])` method returns a Future of `VirtualAccountTransactionsResponse?` which we await for the actual response as seen above.

    final VirtualAccountTransactionsResponse? response = await zainpay.getVirtualAccountTransactions(accountNumber, count);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `getBankList()` method returns a Future of `BankListResponse?` which we await for the actual response as seen above.

    final BankListResponse? response = await zainpay.getBankList();

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `getAccountName(bankCode, accountNumber)` method returns a Future of `AccountNameResponse?` which we await for the actual response as seen above.

    final AccountNameResponse? response = await zainpay.getAccountName(bankCode, accountNumber);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `verifyTransfer(txnRef)` method returns a Future of `TransferVerificationResponse?` which we await for the actual response as seen above.

    final TransferVerificationResponse? response = await zainpay.verifyTransfer(txnRef);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `verifyDeposit(txnRef)` method returns a Future of `DepositVerificationResponse?` which we await for the actual response as seen above.

    final DepositVerificationResponse? response = await zainpay.verifyDeposit(txnRef);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `getZainboxTransactionHistory(zainboxCode, count[optional])` method returns a Future of `ZainboxTransactionHistoryResponse?` which we await for the actual response as seen above.

    final ZainboxTransactionHistoryResponse? response = await zainpay.getZainboxTransactionHistory(zainboxCode, count);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `getZainboxCollectionSummaryByDate(zainboxCode, {dateFrom, dateTo})` method returns a Future of `ZainboxCollectionSummaryByDateResponse?` which we await for the actual response as seen above.

    final ZainboxCollectionSummaryByDateResponse? response = await zainpay.getZainboxCollectionSummaryByDate(zainboxCode, {dateFrom, dateTo});

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

#### Note:
dateTo and DateFrom are optional

Calling the `createVirtualAccount(fullName, email, mobileNumber, zainboxCode)` method returns a Future of `CreateVirtualAccountResponse?` which we await for the actual response as seen above.

    final CreateVirtualAccountResponse? response = await zainpay.createVirtualAccount(fullName, email, mobileNumber, zainboxCode);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `createSettlement(name, scheduleType, schedulePeriod, settlementList, status, zainboxCode)` method returns a Future of `CreateSettlementResponse?` which we await for the actual response as seen above.

    final CreateSettlementResponse? response = await zainpay.createSettlement(name, scheduleType, schedulePeriod, settlementList, status, zainboxCode);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `transferFund(destinationAccountNumber, destinationBankCode, amount, txnRef, narration, sourceAccountNumber, sourceBankCode, zainboxCode)` method returns a Future of `FundTransferResponse?` which we await for the actual response as seen above.

    final FundTransferResponse? response = await zainpay.transferFund(destinationAccountNumber, destinationBankCode, amount, txnRef, narration, sourceAccountNumber, sourceBankCode, zainboxCode);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `updateVirtualAccountStatus(status, accountNumber, zainboxCode)` method returns a Future of `UpdateVirtualAccountStatusResponse?` which we await for the actual response as seen above.

    final UpdateVirtualAccountStatusResponse? response = await zainpay.updateVirtualAccountStatus(status, accountNumber, zainboxCode);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

Calling the `initializeCardPayment(amount, txnRef, mobileNumber, zainboxCode, email, callbackUrl)` method returns a Future of `CardPaymentResponse?` which we await for the actual response as seen above.
The `amount` parameter should be in kobo decimalisation, txnRef (unique per each request)

    final CardPaymentResponse? response = await zainpay.initializeCardPayment(amount, txnRef, mobileNumber, zainboxCode, email, callbackUrl);

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }


#### Note:

1. All requests can be null if a user cancels the transaction by pressing back.
2. You need to confirm the transaction is successful. Ensure that the txnRef, amount, and status are correct and successful.
3. Be sure to verify the transaction details before providing value.

## License

By contributing to the Flutter library, you agree that your contributions will be licensed under its [MIT license](/LICENSE).

Copyright (c) [zainpay.ng](https://zainpay.ng)
