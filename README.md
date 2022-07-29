<p align="center">  
   <img title="Zainpay" height="100" src="https://raw.githubusercontent.com/itcglobal/zainpay/main/zainpay.png" width="50%"/>
</p>  

# Zainpay Flutter Package

The Flutter library helps you create seamless payment experiences in your flutter mobile app.
By connecting to our modal, you can start collecting payment in no time.

## Table of Contents

1. [Requirements](#requirements)
2. [Installation](#installation)
3. [Usage](#usage)
4. [License](#License)

## Requirements

1. Zainpay Account [API Keys](https://zainpay.ng)
2. Supported Flutter version >= 1.17.0

## Installation

1. Add the dependency to your project. In your `pubspec.yaml`, file add: `zainpay: 0.0.5`.
2. Run `flutter pub get`.

## Usage

### Initializing a Zainpay instance

To create an instance, you should call the Zainpay constructor. This constructor accepts a mandatory instance of the following:

-  `context`
-  `publicKey`
-  `transactionRef`
-  `email`
-  `fullName`
-  `mobileNumber`
-  `zainboxCode`
-  `successCallBackUrl`
-  `failureCallBackUrl`
-  `amount`

It returns an instance of Zainpay which we then call the async method `.charge()` on.

    _handlePaymentInitialization() async {
        final Zainpay zainpay = Zainpay(
            context: context,
            publicKey: getPublicKey(),
            transactionRef: getRandomString(16),
            email: emailController.text.toString(),
            fullName: nameController.text.toString(),
            mobileNumber: phoneController.text.toString(),
            zainboxCode: getZainboxCode(),
            successCallBackUrl: 'test.zainpay.ng/success',
            failureCallBackUrl: 'test.zainpay.ng/failure',
            amount: double.parse(amountController.text.toString())
        );
        final PaymentResponse? response = await zainpay.charge();
        if (response != null) {
            showLoading(response.status!);
            debugPrint("${response.toJson()}");
        } else {
            showLoading("No Response!");
        }
    }

### Handling the response

Calling the `.charge()` method returns a Future of `PaymentResponse?` which we await for the actual response as seen above.

    final PaymentResponse? response = await zainpay.charge();

    if (response != null) {
        showLoading(response.status!);
        debugPrint("${response.toJson()}");
    } else {
        showLoading("No Response!");
    }

#### Note:

1. `PaymentResponse` can be null if a user cancels the transaction by pressing back.
2. You need to confirm the transaction is successful. Ensure that the txRef, amount, and status are correct and successful. Be sure to verify the transaction details before providing value.

## License

By contributing to the Flutter library, you agree that your contributions will be licensed under its [MIT license](/LICENSE).

Copyright (c) [zainpay.ng](https://zainpay.ng)
