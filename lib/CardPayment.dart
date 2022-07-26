import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zainpay/PaymentIntro.dart';

import 'Constants.dart';
import 'SuccessfulPayment.dart';

class CardPayment extends StatefulWidget {

  final String email;
  final String reference;
  final double amount;

  const CardPayment({
    Key? key,
    required this.email,
    required this.reference,
    required this.amount
  }) : super(key: key);

  @override
  CardPaymentState createState() => CardPaymentState();
}

class CardPaymentState extends State<CardPayment> {

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20, right: 16, left: 16),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: hexToColor(blackColor),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Image(
                          // fit: BoxFit.cover,
                          height: 8,
                          width: 35,
                          image: AssetImage(
                              'images/patoosh.png'
                          ),
                        ),
                      ),
                      const SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.email,
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            ),),
                          const SizedBox(height: 4,),
                          Text('NGN ${formatter.format(widget.amount)}',
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
                              accountName: 'Patoosh Cafe',
                              reference: widget.reference,
                              amount: widget.amount,
                              email: widget.email,
                              isSuccessful: false,
                              pageRoute: MaterialPageRoute(builder: (context) => const PaymentIntro(
                                  email: "test@zainpay.ng",
                                  reference: "reference2345432",
                                  amount: 120.3)),
                            ),
                          ),
                          ),
                          child: Text('Pay NGN ${formatter.format(widget.amount)}',
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
}
