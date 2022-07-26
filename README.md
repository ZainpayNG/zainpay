<p align="center">  
   <img title="ZainPay" height="100" src="https://github.com/itcglobal/zainpay/blob/main/zainpay.png" width="50%"/>
</p>  

# ZainPay Flutter Package

The Flutter library helps you create seamless payment experiences in your dart mobile app. By connecting to our modal, you can start collecting payment in no time.


## Table of Contents

1. [Requirements](#requirements)
2. [Installation](#installation)
3. [Usage](#usage)

## Requirements

1. ZainPay for business [API Keys](https://zainpay.ng/developers)
2. Supported Flutter version >= 1.17.0


## Installation process

1. Add the dependency to your project. In your `pubspec.yaml` file add: `zainpay: 0.0.1`
2. Run `flutter pub get`

## Usage

### Initializing a Zainpay instance

To create an instance, you should call the Zainpay constructor. This constructor accepts a mandatory instance of the following:

- The calling
-  `publicKey`
-  `amount`
-  `email`
-  `fullName`
-  `transactionRef`
-  `isDebug`

It returns an instance of Zainpay which we then call the async method `.charge()` on.

    _handlePaymentInitialization() async { 
    final style = FlutterwaveStyle(
     appBarText: "My Standard Blue", 
     buttonColor: Color(0xffd0ebff), 
     appBarIcon: Icon(Icons.message, color: Color(0xffd0ebff)),
     buttonTextStyle: TextStyle( 
	     color: Colors.black, 
	     fontWeight: FontWeight.bold, 
	     fontSize: 18), 
    appBarColor: Color(0xffd0ebff), 
    dialogCancelTextStyle: TextStyle(
	    color: Colors.redAccent, 
	    fontSize: 18
	    ),
    dialogContinueTextStyle: TextStyle(
		    color: Colors.blue, 
		    fontSize: 18
		    ) 
		  ); 

    final Customer customer = Customer(
		    name: "FLW Developer", 
		    phoneNumber: "1234566677777", 
		    email: "customer@customer.com"
		    );  
		    
    final Flutterwave flutterwave = Flutterwave(
		    context: context, 
		    style: style, 
		    publicKey: "Public Key, 
		    currency: "RWF", 
		    redirectUrl: "my_redirect_url" 
		    txRef: "unique_transaction_reference", 
		    amount: "3000", 
		    customer: customer, 
		    paymentOptions: "ussd, card, barter, payattitude", 
		    customization: Customization(title: "Test Payment"),
		    isDebug: true
		    ); 
		}

## License

By contributing to the Flutter library, you agree that your contributions will be licensed under its [MIT license](/LICENSE).

Copyright (c) Zainpay.ng.

## Built Using

- [flutter](https://flutter.dev/)
- [http](https://pub.dev/packages/http)
- [flutter_inappwebview](https://pub.dev/packages/flutter_inappwebview)
- [fluttertoast](https://pub.dev/packages/fluttertoast)
