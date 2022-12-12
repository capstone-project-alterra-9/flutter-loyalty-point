import "package:flutter/material.dart";
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQDetailView extends StatefulWidget {
  static const routeName = "/faqdetail";
  const FAQDetailView({super.key});

  @override
  State<FAQDetailView> createState() => _FAQDetailViewState();
}

class _FAQDetailViewState extends State<FAQDetailView> {
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
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset("assets/icons/icon_customer_service.svg"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text(
                    "Why has the product I purchased not been entered / accepted?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Styles.colorBlack400),
                  ),
                  const Divider(),
                  const Text(
                    "Make sure you have made a payment in accordance with the total transaction (no less and no more) & also the selected payment method. For credit products, internet packages, e-money, and cashout will be received by customers within 30 seconds after making a payment. In case of problems, please wait a maximum of 1 x 24 hours. More than that time, you can immediately contact the Jokomart Customer Service team via live chat on the features available on the mobile app or email to care@jokomart.com .",
                    style: TextStyle(fontSize: 13, color: Styles.colorBlack400),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
              onPressed: () {},
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
      ),
    );
  }
}
