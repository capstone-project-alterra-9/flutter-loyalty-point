import "package:flutter/material.dart";
import 'package:flutter_loyalty_point/src/models/faq/faq_model.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQDetailView extends StatefulWidget {
  static const routeName = "/faqdetail";
  final FaqModel faqDetail;
  const FAQDetailView({super.key, required this.faqDetail});

  @override
  State<FAQDetailView> createState() => _FAQDetailViewState();
}

class _FAQDetailViewState extends State<FAQDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
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
                  Text(
                    widget.faqDetail.title.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Styles.colorBlack400),
                  ),
                  const Divider(),
                  Text(
                    widget.faqDetail.body.toString(),
                    style: const TextStyle(
                        fontSize: 13, color: Styles.colorBlack400),
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
