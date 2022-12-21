import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TermsAndConditionsViewModel extends ChangeNotifier {
  void toCustomerService() async {
    await launchUrlString(
      "https://wa.me/6288287112431",
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }
}
