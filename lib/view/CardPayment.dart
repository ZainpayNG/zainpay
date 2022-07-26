import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zainpay/view/PaymentIntro.dart';
import 'package:zainpay/models/standard_request.dart';

import '../core/transaction_callback.dart';
import 'Constants.dart';
import 'SuccessfulPayment.dart';

class CardPayment extends StatefulWidget {

  final StandardRequest request;
  final BuildContext context;

  const CardPayment({
    Key? key,
    required this.request,
    required this.context
  }) : super(key: key);

  @override
  CardPaymentState createState() => CardPaymentState();
}

class CardPaymentState extends State<CardPayment> implements TransactionCallBack {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        child: Text('Pay with Card',
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                color: hexToColor(blackColor),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            )
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 201,
                        child: Text('Enter your card details below',
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                color: hexToColor(blackColor),
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            )
                        ),
                      ),
                      Container(
                        height: 80,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.only(left: 16, top: 6),
                        decoration: BoxDecoration(
                          color: hexToColor(dividerGreyColor),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Card Number',
                                style: blackTextStyle.copyWith(
                                    fontFamily: paymentFontFamily,
                                    color: hexToColor(blackColor),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400
                                )
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              minLines: 1,
                              cursorColor: hexToColor(blackColor),
                              decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  ),
                                  errorStyle: blackTextStyle.copyWith(
                                      fontFamily: paymentFontFamily,
                                      fontSize: 8,
                                      height: .08,
                                      color: hexToColor(redColor)
                                  ),
                                  errorMaxLines: 1,
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  ),
                                  filled: true,
                                  hintText: '0000 0000 0000 0000',
                                  border: InputBorder.none,
                                  fillColor: hexToColor(dividerGreyColor),
                                  hintStyle: blackTextStyle.copyWith(
                                      fontFamily: paymentFontFamily,
                                      color: hexToColor(textGreyColor),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 16, )
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 80,
                              width: 152,
                              padding: const EdgeInsets.only(left: 16, top: 6),
                              decoration: BoxDecoration(
                                color: hexToColor(dividerGreyColor),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Card Expiry',
                                      style: blackTextStyle.copyWith(
                                          fontFamily: paymentFontFamily,
                                          color: hexToColor(blackColor),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400
                                      )
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    minLines: 1,
                                    cursorColor: hexToColor(blackColor),
                                    decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none
                                        ),
                                        errorStyle: blackTextStyle.copyWith(
                                            fontFamily: paymentFontFamily,
                                            fontSize: 8,
                                            height: .08,
                                            color: hexToColor(redColor)
                                        ),
                                        errorMaxLines: 1,
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none
                                        ),
                                        filled: true,
                                        hintText: 'MM / YY',
                                        border: InputBorder.none,
                                        fillColor: hexToColor(dividerGreyColor),
                                        hintStyle: blackTextStyle.copyWith(
                                            fontFamily: paymentFontFamily,
                                            color: hexToColor(textGreyColor),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(vertical: 16, )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 0,),
                            Container(
                              height: 80,
                              width: 164,
                              padding: const EdgeInsets.only(left: 16, top: 6, right: 10),
                              decoration: BoxDecoration(
                                color: hexToColor(dividerGreyColor),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('CVV',
                                          style: blackTextStyle.copyWith(
                                              fontFamily: paymentFontFamily,
                                              color: hexToColor(blackColor),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400
                                          )
                                      ),
                                      Text('What is this?',
                                          style: blackTextStyle.copyWith(
                                              fontFamily: paymentFontFamily,
                                              color: hexToColor(blackColor),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400
                                          )
                                      ),
                                    ],
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    minLines: 1,
                                    cursorColor: hexToColor(blackColor),
                                    decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none
                                        ),
                                        errorStyle: blackTextStyle.copyWith(
                                            fontFamily: paymentFontFamily,
                                            fontSize: 8,
                                            height: .08,
                                            color: hexToColor(redColor)
                                        ),
                                        errorMaxLines: 1,
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none
                                        ),
                                        filled: true,
                                        hintText: '123',
                                        border: InputBorder.none,
                                        fillColor: hexToColor(dividerGreyColor),
                                        hintStyle: blackTextStyle.copyWith(
                                            fontFamily: paymentFontFamily,
                                            color: hexToColor(textGreyColor),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(vertical: 16, )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            color: hexToColor(paymentBlueBackgroundColor)
                        ),
                        width: 328,
                        height: 48,
                        child: MaterialButton(
                          onPressed: () => Navigator.push(
                            context, MaterialPageRoute(
                            builder: (BuildContext context) => SuccessfulPayment(
                              request: widget.request,
                              isSuccessful: false,
                              pageRoute: MaterialPageRoute(builder: (context) => PaymentIntro(
                                context: widget.context,
                                  standardRequest: widget.request
                              )
                              ),
                            ),
                          ),
                          ),
                          child: Text('Pay NGN ${formatter.format(widget.request.amount)}',
                              style: blackTextStyle.copyWith(
                                  fontFamily: paymentFontFamily,
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              )
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(4)),
                              color: hexToColor(paymentIconBlueBackgroundColor)
                          ),
                          width: 220,
                          height: 40,
                          child: MaterialButton(
                              onPressed: () => Navigator.pop(context),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'images/left_arrow.svg',
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.scaleDown
                                  ),
                                  const SizedBox(width: 7,),
                                  Text('Change Payment Method',
                                      style: blackTextStyle.copyWith(
                                          fontFamily: paymentFontFamily,
                                          color: hexToColor(paymentBlueBackgroundColor),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                      )
                                  ),
                                ],
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  onCancelled() {
    // TODO: implement onCancelled
    throw UnimplementedError();
  }

  @override
  onTransactionError() {
    // TODO: implement onTransactionError
    throw UnimplementedError();
  }

  @override
  onTransactionSuccess(String id, String txRef) {
    // TODO: implement onTransactionSuccess
    throw UnimplementedError();
  }
}
