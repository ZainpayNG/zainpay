import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zainpay/models/request/card_validation_request.dart';
import 'package:zainpay/models/request/otp_validation_request.dart';
import 'package:zainpay/models/response/card_validation_response.dart';
import 'package:zainpay/models/response/payment_response.dart';
import 'package:zainpay/utils.dart';
import 'package:zainpay/models/request/standard_request.dart';

import '../models/transaction_error.dart';
import 'Constants.dart';
import 'SuccessfulPayment.dart';

class CardPayment extends StatefulWidget {

  final StandardRequest request;
  final String sessionId;
  final BuildContext context;

  const CardPayment({
    Key? key,
    required this.request,
    required this.sessionId,
    required this.context
  }) : super(key: key);

  @override
  CardPaymentState createState() => CardPaymentState();
}

class CardPaymentState extends State<CardPayment> {

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _pinNumberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  bool isLoading = false;

  Future<CardValidationResponse> startCardPayment(final CardValidationRequest request) async {
    try {
      final CardValidationResponse cardValidationResponse = await request.cardValidation();
      if (cardValidationResponse.sessionId != null) {
        throw (TransactionError(cardValidationResponse.description!));
      }
      return cardValidationResponse;
    } catch (error) {
      debugPrint("error is $error");
      rethrow;
    }
  }

  Future<PaymentResponse> startOTPProcessing(final OTPValidationRequest request) async {
    try {
      final PaymentResponse cardValidationResponse = await request.otpValidation();
      if (cardValidationResponse.code != "00" ) {
        throw (TransactionError(cardValidationResponse.description!));
      }
      return cardValidationResponse;
    } catch (error) {
      debugPrint("error is $error");
      rethrow;
    }
  }

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
                  margin: const EdgeInsets.only(top: 20, bottom: 20, right: 16, left: 16),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.request.email,
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            ),),
                          const SizedBox(height: 4,),
                          Text('NGN ${formatter.format(widget.request.amount)}',
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(right: 0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            color: hexToColor(paymentCancelButtonColor)
                        ),
                        width: 75,
                        height: 32,
                        child: MaterialButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel',
                              style: blackTextStyle.copyWith(
                                  fontFamily: paymentFontFamily,
                                  color: hexToColor(paymentTextColor),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: hexToColor(dividerGreyColor),
                  ),
                ),
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
                              controller: _cardNumberController,
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
                              height: 75,
                              width: 130,
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 6),
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
                                    controller: _dateController,
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
                            const Spacer(),
                            Container(
                              height: 75,
                              width: 130,
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 6),
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
                                    controller: _cvvController,
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
                        height: 75,
                        width: 130,
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 6),
                        decoration: BoxDecoration(
                          color: hexToColor(dividerGreyColor),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                                Text('Card PIN',
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
                              obscureText: true,
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
                                  hintText: '****',
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
                      isLoading ? Center(
                        child: CircularProgressIndicator(
                          color: hexToColor(paymentBlueBackgroundColor),
                          strokeWidth: .5,
                        )) : Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            color: hexToColor(paymentBlueBackgroundColor)
                        ),
                        width: 328,
                        height: 48,
                        child: MaterialButton(
                          onPressed: () async {

                            setState(() => isLoading = true);

                            CardValidationRequest cardValidationRequest = CardValidationRequest(
                                sessionId: widget.sessionId,
                                cardEncryptionData: Utils.encryptedCard,
                                publicKey: Utils.token
                            );

                            await startCardPayment(cardValidationRequest).then((value) async {
                              if(value.status == "Success" && value.code == "00"){
                                OTPValidationRequest otpValidationRequest = OTPValidationRequest(
                                    sessionId: value.sessionId!,
                                    otp: "12345",
                                    publicKey: Utils.token
                                );
                                await startOTPProcessing(otpValidationRequest).then((value) {
                                  if(value.code == "00" && value.status == "Success"){
                                    PaymentResponse paymentResponse = PaymentResponse(
                                      code: value.code,
                                      description: value.description,
                                      otpValidationDataResponse: value.otpValidationDataResponse,
                                      status: value.status
                                    );
                                    setState(() => isLoading = false);
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                      builder: (BuildContext context) => SuccessfulPayment(
                                        paymentResponse: paymentResponse,
                                        request: widget.request,
                                        context: widget.context,
                                      ),
                                    ), (ModalRoute.withName(Navigator.defaultRouteName)));
                                  }
                                });
                              }
                            });
                          },
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
                                  Icon(FontAwesomeIcons.arrowLeft, size: 12, color: hexToColor(paymentBlueBackgroundColor),),
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
}
