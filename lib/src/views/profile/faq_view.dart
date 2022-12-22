import "package:flutter/material.dart";
import 'package:flutter_loyalty_point/src/views/profile/faq_widget/generalfaq_widget.dart';
import 'package:flutter_loyalty_point/src/views/profile/faq_widget/paymentfaq_widget.dart';
import 'package:flutter_loyalty_point/src/views/profile/faq_widget/transactionstatusfaq_widget.dart';
import 'package:flutter_loyalty_point/src/views/profile/faqdetail_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../styles/styles.dart';
import '../../view_models/profile/faq_viewmodel.dart';

class FAQView extends StatefulWidget {
  static const routeName = "/faq";
  const FAQView({super.key});

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  bool _chipGeneral = false;
  bool _chipTransactionStatus = false;
  bool _chipPayment = false;
  @override
  void initState() {
    setState(() {
      _chipGeneral = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "FAQs",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        actions: [
          GestureDetector(
            onTap: () async {
              await launchUrlString(
                "https://wa.me/6288287112431",
                mode: LaunchMode.externalNonBrowserApplication,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset("assets/icons/icon_customer_service.svg"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/faq_image.png"),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: 225,
              padding: const EdgeInsets.all(20),
            ),
            Row(
              children: [],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _chipGeneral = true;
                            _chipTransactionStatus = false;
                            _chipPayment = false;
                          });
                        },
                        child: Chip(
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: _chipGeneral == true
                                        ? Styles.colorGreen500
                                        : Colors.grey)),
                            backgroundColor: _chipGeneral == true
                                ? Styles.colorGreen500
                                : Colors.grey[50],
                            label: Text(
                              "General",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _chipGeneral == true
                                      ? Colors.white
                                      : Colors.grey),
                            )),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _chipTransactionStatus = true;
                            _chipGeneral = false;
                            _chipPayment = false;
                          });
                        },
                        child: Chip(
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: _chipTransactionStatus == true
                                        ? Styles.colorGreen500
                                        : Colors.grey)),
                            backgroundColor: _chipTransactionStatus == true
                                ? Styles.colorGreen500
                                : Colors.grey[50],
                            label: Text(
                              "Transaction Status",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _chipTransactionStatus == true
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _chipTransactionStatus = false;
                            _chipGeneral = false;
                            _chipPayment = true;
                          });
                        },
                        child: Chip(
                            shape: StadiumBorder(
                                side: BorderSide(
                              color: _chipPayment == true
                                  ? Styles.colorGreen500
                                  : Colors.grey,
                            )),
                            backgroundColor: _chipPayment == true
                                ? Styles.colorGreen500
                                : Colors.grey[50],
                            label: Text(
                              "Payment",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _chipPayment == true
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _chipGeneral == true
                      ? const GeneralFAQWidget()
                      : _chipTransactionStatus == true
                          ? const TransactionStatusFAQWidget()
                          : _chipPayment == true
                              ? const PaymentFAQWidget()
                              : const SizedBox(
                                  height: 5,
                                ),
                  const Text(
                    "Still haven't found your answer?",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await launchUrlString(
                        "https://wa.me/6288287112431",
                        mode: LaunchMode.externalNonBrowserApplication,
                      );
                    },
                    style: Styles.primaryButton.copyWith(
                      minimumSize: const MaterialStatePropertyAll(
                        Size.fromHeight(44),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/icon_customer_service.svg",
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Contact Our Customer Care",
                          style: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
