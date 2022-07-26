import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zainpay/models/standard_request.dart';

import 'BankTransferPayment.dart';
import 'Constants.dart';

class SuccessfulPayment extends StatefulWidget {

  final StandardRequest request;
  final bool isSuccessful;
  final MaterialPageRoute pageRoute;

  const SuccessfulPayment({
    Key? key,
    required this.request,
    required this.isSuccessful,
    required this.pageRoute,
  }) : super(key: key);

  @override
  SuccessfulPaymentState createState() => SuccessfulPaymentState();
}

class SuccessfulPaymentState extends State<SuccessfulPayment> {

  double total = 0.0, takeAwayFee = 0.0, vat = 0.0, deliveryFee = 0.0, serviceFee = 0.0;
  int quantity = 0;

  @override
  void initState() {
    super.initState();
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                Center(
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isSuccessful ? hexToColor(paymentIconBlueBackgroundColor) : hexToColor(redColor).withOpacity(0.3),
                    ),
                    child: Container(
                      height: 40.29,
                      width: 40.29,
                      margin: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.isSuccessful ? hexToColor(paymentBlueBackgroundColor) : hexToColor(darkRed),
                      ),
                      child: SvgPicture.asset(
                          widget.isSuccessful ? 'images/single_check.svg' : 'images/error_image.svg',
                          height: 15,
                          width: 15,
                          fit: BoxFit.scaleDown
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Center(
                  child: widget.isSuccessful ? Text(
                      'Transaction Successful',
                      textAlign: TextAlign.center,
                      style: blackTextStyle.copyWith(
                          fontFamily: paymentFontFamily,
                          color: hexToColor(blackColor),
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                      )
                  ) : Text(
                      'Transaction Unsuccessful',
                      textAlign: TextAlign.center,
                      style: blackTextStyle.copyWith(
                          fontFamily: paymentFontFamily,
                          color: hexToColor(blackColor),
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                      )
                  ),
                ),
                const SizedBox(height: 16,),
                widget.isSuccessful ? Center(
                  child: SizedBox(
                    width: 199,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('N${formatter.format(widget.request.amount.toInt())}',
                                style: blackTextStyle.copyWith(
                                    fontFamily: paymentFontFamily,
                                    color: hexToColor(paymentTextColor),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                )
                            ),
                            Text('is Successful',
                                style: blackTextStyle.copyWith(
                                    fontFamily: paymentFontFamily,
                                    color: hexToColor(paymentTextColor),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ) : Container(height: 30,),
                const SizedBox(height: 40,),
                widget.isSuccessful ? SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: .5,
                    color: hexToColor(paymentBlueBackgroundColor),
                  ),
                ) : Container(),
                !widget.isSuccessful ? Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          color: hexToColor(paymentBlueBackgroundColor)
                      ),
                      width: 328,
                      height: 48,
                      child: MaterialButton(
                        height: 48,
                        onPressed: () {
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                builder: (BuildContext context) => BankTransferPayment(
                                  context: context,
                                  request: widget.request,
                                )
                            ), (ModalRoute.withName(Navigator.defaultRouteName)));
                          });
                        },
                        child: Text('Try Again',
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
                      ),
                    )
                ) : Container(),
                widget.isSuccessful ? const SizedBox(height: 80) : Container(),
                widget.isSuccessful ? Center(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                        'You will be redirected automatically, please wait',
                        textAlign: TextAlign.center,
                        style: blackTextStyle.copyWith(
                            fontFamily: paymentFontFamily,
                            color: hexToColor(textGreyColor),
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        )
                    ),
                  ),
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
