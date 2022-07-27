<p align="center">  
   <img title="Zainpay" height="100" src="https://raw.githubusercontent.com/itcglobal/zainpay/main/zainpay.png" width="50%"/>
</p>  

# Zainpay Flutter Package

The Flutter library helps you create seamless payment experiences in your dart mobile app. By connecting to our modal, you can start collecting payment in no time.


## Table of Contents

1. [Requirements](#requirements)
2. [Installation](#installation)
3. [Usage](#usage)

## Requirements

1. Zainpay for business [API Keys](https://zainpay.ng/developers)
2. Supported Flutter version >= 1.17.0


## Installation

1. Add the dependency to your project. In your `pubspec.yaml` file add: `zainpay: 0.0.3`
2. Run `flutter pub get`

## Usage

### Initializing a Zainpay instance

To create an instance, you should call the Zainpay constructor. This constructor accepts a mandatory instance of the following:

-  `context`
-  `fullName`
-  `email`
-  `publicKey`
-  `narration`
-  `transactionRef`
-  `amount`

It returns an instance of Zainpay which we then call the async method `.charge()` on.

    `_handlePaymentInitialization() async {
    final Zainpay zainpay = Zainpay(
        context: context,
        fullName: nameController.text.toString(),
        email: emailController.text.toString(),
        publicKey: getPublicKey(),
        narration: narrationController.text.toString(),
        transactionRef: getRandomString(16),
        amount: double.parse(amountController.text.toString())
    );
    final ChargeResponse response = await zainpay.charge();
    if (response != null) {
      showLoading(response.status!);
      debugPrint("${response.toJson()}");
    } else {
      showLoading("No Response!");
    }
    }`

## License

By contributing to the Flutter library, you agree that your contributions will be licensed under its [MIT license](/LICENSE).

Copyright (c) zainpay.ng
