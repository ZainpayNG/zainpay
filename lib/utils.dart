class Utils {
  static const _prodBaseURL = "https://api.ravepay.co/v3/sdkcheckout/";
  static const standardPayment = "payments";

  /// Returns base url depending on test mode
  static String getBaseUrl() => _prodBaseURL;

}