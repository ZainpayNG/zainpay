import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';

import 'APICalls.dart';
import 'Constants.dart';
import 'SuccessfulPayment.dart';

class BankTransferPayment extends StatefulWidget {

  final String reference;
  final String email;
  final double amount;

  const BankTransferPayment({
    Key? key,
    required this.reference,
    required this.email,
    required this.amount
  }) : super(key: key);

  @override
  BankTransferPaymentState createState() => BankTransferPaymentState();
}

class BankTransferPaymentState extends State<BankTransferPayment> with WidgetsBindingObserver {

  String accountNumber = "", orderReference = "", accountName = "",
      bankName = "";
  bool isLoading = false;
  late APiCalls aPiCalls;
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 7000 * 60;

  @override
  void initState() {
    super.initState();
    aPiCalls = APiCalls();
    controller = CountdownTimerController(endTime: endTime);
  }

  Future<void> _copyToClipboard(text) async {
    await Clipboard.setData(ClipboardData(text: text));
    showToast(message: 'Copied');
  }

  void reRouteToSuccess(isSuccessful) async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (BuildContext context) => SuccessfulPayment(
        isSuccessful: isSuccessful,
        accountName: accountName,
        reference: widget.reference,
        amount: widget.amount,
        email: widget.email,
        pageRoute: MaterialPageRoute(builder: (context) =>
            BankTransferPayment(
                reference: widget.reference,
                email: widget.email,
                amount: widget.amount)
        ),
      ),
    ), (ModalRoute.withName(Navigator.defaultRouteName)));
  }

  @override
  Widget build(BuildContext context) {

    Text text = Text(accountNumber,
        style: blackTextStyle.copyWith(
            fontFamily: paymentFontFamily,
            color: hexToColor(blackColor),
            fontSize: 14,
            fontWeight: FontWeight.w400
        )
    );

    return Scaffold(
      body: SingleChildScrollView(
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
                        Text('N${formatter.format(widget.amount.abs())}',
                          style: blackTextStyle.copyWith(
                              fontFamily: paymentFontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
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
                margin: const EdgeInsets.only(left: 16, top: 8, bottom: 12),
                child: Text('Pay with Bank Transfer',
                    style: blackTextStyle.copyWith(
                        fontFamily: paymentFontFamily,
                        color: hexToColor(blackColor),
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 70,
                  child : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Make a bank transfer of ',
                                  style: blackTextStyle.copyWith(
                                      fontFamily: paymentFontFamily,
                                      color: hexToColor(paymentTextColor),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  )
                              ),
                              Text('N${formatter.format(widget.amount.abs())}',
                                  style: blackTextStyle.copyWith(
                                      fontFamily: paymentFontFamily,
                                      color: hexToColor(blackColor),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            ],
                          ),
                          Text('to the account number below',
                              style: blackTextStyle.copyWith(
                                  fontFamily: paymentFontFamily,
                                  color: hexToColor(paymentTextColor),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 18,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                      color: hexToColor(dividerGreyColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        Text('Bank',
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                color: hexToColor(paymentTextColor),
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
                        const Spacer(),
                        Text(bankName,
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                color: hexToColor(blackColor),
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
                      ],
                    ),
                  ) ,
                  SizedBox(
                    height: 18,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                      color: hexToColor(dividerGreyColor),
                    ),
                  ),
                  Container (
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        Text('Account Number',
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                color: hexToColor(paymentTextColor),
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () => _copyToClipboard(text.data),
                          child: SvgPicture.asset(
                              'images/copy.svg',
                              height: 20,
                              width: 20,
                              fit: BoxFit.contain
                          ),
                        ),
                        const Spacer(),
                        text,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                      color: hexToColor(dividerGreyColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        Text('Account Name',
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                color: hexToColor(paymentTextColor),
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
                        const Spacer(),
                        Text('PATOOSH CAFE',
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                color: hexToColor(blackColor),
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                      color: hexToColor(dividerGreyColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        Text('Amount To Pay',
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                color: hexToColor(paymentTextColor),
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
                        const Spacer(),
                        Text('N${formatter.format((widget.amount).abs())}',
                            style: blackTextStyle.copyWith(
                                fontFamily: paymentFontFamily,
                                color: hexToColor(blackColor),
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
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
                  isLoading ? Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        strokeWidth: .5,
                        color: hexToColor(paymentBlueBackgroundColor),
                      ),
                    ),
                  ) : Center(
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            color: hexToColor(paymentBlueBackgroundColor)
                        ),
                        width: 328,
                        height: 48,
                        child: MaterialButton(
                          onPressed: () async {
                            setState(() => isLoading = true);
                          },
                          child: Text('Confirm Payment',
                              style: blackTextStyle.copyWith(
                                  fontFamily: paymentFontFamily,
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              )
                          ),
                        )
                    ),
                  )
                ],
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: hexToColor(paymentIconBlueBackgroundColor)
                  ),
                  width: 180,
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
                          Text('Cancel Transaction',
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
              ),
              const SizedBox(height: 15),
              Center(
                child: CountdownTimer(
                    endTime: endTime,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if(time == null){
                        return Container();
                      }else {
                        if(time.min == null) {
                          return Text('00:${time.sec}',
                            style: blackTextStyle.copyWith(
                                color: hexToColor(paymentBlueBackgroundColor),
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                          );
                        }else {
                          return Text('${time.min}:${time.sec}',
                            style: blackTextStyle.copyWith(
                                color: hexToColor(paymentBlueBackgroundColor),
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                          );
                        }
                      }
                    }
                ),
              ),
              const SizedBox(height: 50,),
              Center(
                child: Text('Secured by zainpay',
                  style: blackTextStyle.copyWith(
                      color: hexToColor(paymentBlueBackgroundColor),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
