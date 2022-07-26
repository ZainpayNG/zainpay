import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'BankTransferPayment.dart';
import 'CardPayment.dart';
import 'Constants.dart';

class PaymentIntro extends StatefulWidget {

  final String email;
  final String reference;
  final double amount;

  const PaymentIntro({
    Key? key,
    required this.email,
    required this.reference,
    required this.amount
  }) : super(key: key);

  @override
  PaymentIntroState createState() => PaymentIntroState();
}

class PaymentIntroState extends State<PaymentIntro> {

  @override
  void initState() {
    super.initState();
  }

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
                    Container(
                      height: 48,
                      width: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: hexToColor(blackColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Image(
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
                        Text('NGN ${formatter.format(widget.amount.toInt())}',
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
                margin: const EdgeInsets.all(18),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CardPayment(
                          email: widget.email,
                          reference: widget.reference,
                          amount: widget.amount,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: hexToColor(paymentIconBlueBackgroundColor),
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: SvgPicture.asset(
                            'images/pay_with_card.svg',
                            height: 20,
                            width: 20,
                            fit: BoxFit.scaleDown
                        ),
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
                        child: SvgPicture.asset(
                            'images/vector.svg',
                            height: 10,
                            width: 5,
                            fit: BoxFit.scaleDown
                        ),
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
                        email: widget.email,
                        reference: widget.reference,
                        amount: widget.amount,
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
                        child: SvgPicture.asset(
                            'images/bank_transfer.svg',
                            height: 20,
                            width: 20,
                            fit: BoxFit.scaleDown
                        ),
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
                        child: SvgPicture.asset(
                            'images/vector.svg',
                            height: 10,
                            width: 5,
                            fit: BoxFit.scaleDown
                        ),
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
