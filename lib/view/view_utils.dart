import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ZainpayViewUtils {

  /// Displays a modal to confirm payment
  static Future<void> showConfirmPaymentModal(
      final BuildContext context,
      final String amount,
      final Function onContinuePressed) async => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        const transactionCurrency = "NGN";
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Text(
              "You will be charged a total of $transactionCurrency "
                  "$amount. Do you wish to continue? ",
              textAlign: TextAlign.center,
              // style: textStyle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                letterSpacing: 1.2,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: const Text(
                "CANCEL",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  letterSpacing: 1,
                ),
              ),
            ),
            TextButton(
              onPressed: () => onContinuePressed(),
              child: const Text(
                "CONTINUE",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        );
      },
    );

  /// Shows progress dialog
  Future<void> showProgressDialog(
      final String message,
      final BuildContext context,
      final bool dismissible,
      final Widget? progressIndicator,
      final TextStyle? textStyle,
      final Color? dialogBackgroundColor) {
    final Widget indicator = progressIndicator ?? const CircularProgressIndicator(backgroundColor: Colors.orangeAccent);

    final style =
    textStyle ?? const TextStyle(color: Colors.black);

    return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: dialogBackgroundColor,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              indicator,
              Text(
                message,
                textAlign: TextAlign.center,
                style: style,
              )
            ],
          ),
        );
      },
    );
  }

  static void _goBackToPaymentScreen(final BuildContext context) {
    Navigator.of(context).pop();
  }

  /// Creates a customised Appbar
  static AppBar appBar(
      final BuildContext context,
      final String title,
      final TextStyle appBarTitleTextStyle,
      final Icon appBarIcon,
      final Color appBarColor,
      [final Function? handleBackPress]) {

    return AppBar(
      backgroundColor: appBarColor,
      titleTextStyle: appBarTitleTextStyle,
      leading: IconButton(
        icon: appBarIcon,
        onPressed: () => handleBackPress == null
            ? _goBackToPaymentScreen(context)
            : handleBackPress(),
      ),
      title: Text(title, style: appBarTitleTextStyle),
    );
  }

  /// Displays a Snackbar
  static showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  /// Displays a toast notification
  static void showToast(BuildContext context, String text) {
    Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xAA383737),
      textColor: Colors.white,
    );
  }
}