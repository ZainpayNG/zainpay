import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';

const blackColor = "#0C0C0C";
const dividerGreyColor = "#E6E6E6";
const pendingColor = "#F7CE4D";
const pendingDeliveryColor = "#5B5B5B";
const failedColor = "#EB8481";
const greenColor = "#02B133";
const redColor = "#FC5D53";
const darkRed = "#FC5D53";
const textGreyColor = "#807F86";
const paymentIconBlueBackgroundColor = "#E0EDFF";
const paymentBlueBackgroundColor = "#006AFB";
const textEmailColor = "#808080";
const paymentCancelButtonColor = "#EAEEF3";
const paymentTextColor = "#55586F";
var formatter = NumberFormat('#,###,###');
const fontFamily = 'Inter';
const paymentFontFamily = 'Airbnb Cereal App';

TextStyle blackTextStyle = TextStyle(
    fontFamily: fontFamily,
    color: hexToColor(blackColor),
    fontWeight: FontWeight.w600,
    fontSize: 18
);

Color hexToColor(String code) =>  Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

void showNotification({required message, required error}){
  showSimpleNotification(
    Container(
      height: 50,
      width: 328,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: error ? hexToColor(redColor) : hexToColor(greenColor),
          borderRadius: BorderRadius.circular(4.0)
      ),
      child: Row(
        children: [
          error ? const Icon(FontAwesomeIcons.xmark, size: 10, color: Colors.white,)
              : const Icon(FontAwesomeIcons.checkDouble, size: 10, color: Colors.white,),
          const SizedBox(width: 18,),
          Center(
            child: Text(
              message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: blackTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
        ],
      ),
    ),
    background: Colors.white,
    elevation: 0,
    duration: const Duration(seconds: 3),
  );
}

void showToast({required message}){
  showSimpleNotification(
      Container(
        margin: const EdgeInsets.only(bottom: 40, left: 120, right: 120),
        height: 40,
        width: 30,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: hexToColor(paymentIconBlueBackgroundColor),
            borderRadius: BorderRadius.circular(36)
        ),
        child: Center(
          child: Text(
            message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: blackTextStyle.copyWith(
                color: hexToColor(paymentBlueBackgroundColor),
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),),
        ),
      ),
      background: Colors.white54.withOpacity(0.1),
      elevation: 0,
      position:  NotificationPosition.bottom
  );
}

const privacyPolicyIntro = "Your privacy is important to us. It is Patoosh Cafe Limited’s policy to respect your privacy and comply with any applicable law and regulation regarding any personal information we may collect about you, including across our mobile app.\n\n" +
    "Personal information is any information about you which can be used to identify you. This includes " +
    " information about you as a person (such as name, address, and date of birth), your devices, and even information about how you use a website or online service.\n\n" +

    "In the event the Site contains links to third-party sites and services, please be aware that those sites and services have their own privacy policies. After following a link to any third-party content, you should read their posted privacy policy information about how they " +
    "collect and use personal information. This Privacy Policy does not apply to any of your activities after you leave the Site.\n\n" +

    "This policy is effective as of Feb 1, 2022.\n" +
    "Last updated: Jan 28, 2022";

const termsAndConditionsIntro = "These Terms of Service govern your use of the Patoosh’s App (referred to as the “App”).\n\n" +

    "By accessing the App, you agree to abide by these Terms of Service and to comply with all applicable laws and regulations. If you do not agree with these Terms of Service, you are prohibited from using or accessing the App.\n\n" +

    "We, Patoosh Cafe Limited, reserve the right to review and amend any of these Terms of Service at our sole discretion. Upon doing so, we will update this page. Any changes to these Terms of Service will take effect immediately from the date of publication. Your continued use of the Site following notification of any changes to these Terms of Service constitutes acceptance of those changes.";

const informationWeCollect = "Information we collect falls into one of two categories: “voluntarily provided” information and “automatically collected” information.\n\n" +

    "“Voluntarily provided” information refers to any information you knowingly and actively provide us when using the Site.\n\n" +

    "“Automatically collected” information refers to any information automatically sent by your devices in the course of accessing the Site.";

const logData = "Information we collect falls into one of two categories: “voluntarily provided” information and “automatically collected” information.";

const orderSuccessText = "Order placed successfully.\nYou will get a call when its ready. Thank you!";

const personalInformation = "Information we collect falls into one of two categories: “voluntarily provided” information and “automatically collected” information.";

const collectionAndUseOfInformation = "Information we collect falls into one of two categories: “voluntarily provided” information and “automatically collected” information.";