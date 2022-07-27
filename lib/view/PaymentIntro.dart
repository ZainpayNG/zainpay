import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zainpay/models/standard_request.dart';

import 'BankTransferPayment.dart';
import 'CardPayment.dart';
import 'Constants.dart';

class PaymentIntro extends StatefulWidget {

  final StandardRequest standardRequest;
  final BuildContext context;

  const PaymentIntro({
    Key? key,
    required this.standardRequest,
    required this.context
  }) : super(key: key);

  @override
  PaymentIntroState createState() => PaymentIntroState();
}

class PaymentIntroState extends State<PaymentIntro> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20, right: 16, left: 16),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.standardRequest.email,
                          style: blackTextStyle.copyWith(
                              fontFamily: paymentFontFamily,
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                          ),),
                        const SizedBox(height: 4,),
                        Text('NGN ${formatter.format(widget.standardRequest.amount)}',
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CardPayment(
                        context: widget.context,
                        request: widget.standardRequest,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: hexToColor(paymentIconBlueBackgroundColor),
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Icon(FontAwesomeIcons.ccVisa, size: 12, color: hexToColor(blackColor)),
                      ),
                      const SizedBox(width: 16,),
                      Text('Pay with Card',
                          style: blackTextStyle.copyWith(
                              color: hexToColor(blackColor),
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          )
                      ),
                      const Spacer(),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: hexToColor(paymentCancelButtonColor),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Icon(FontAwesomeIcons.chevronRight, size: 12, color: hexToColor(blackColor),)
                      ),
                    ],
                  ),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => BankTransferPayment(
                        context: context,
                        request: widget.standardRequest,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: hexToColor(paymentIconBlueBackgroundColor),
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Icon(FontAwesomeIcons.buildingColumns, size: 12, color: hexToColor(blackColor),)
                      ),
                      const SizedBox(width: 16,),
                      Text('Pay with Bank Transfer',
                          style: blackTextStyle.copyWith(
                              fontFamily: paymentFontFamily,
                              color: hexToColor(blackColor),
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          )
                      ),
                      const Spacer(),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                            color: hexToColor(paymentCancelButtonColor),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Icon(FontAwesomeIcons.chevronRight, size: 12, color: hexToColor(blackColor),)
                      ),
                    ],
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
