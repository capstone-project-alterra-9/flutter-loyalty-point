import "package:flutter/material.dart";
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/view_models/profile/termsandconditions_viewmodel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TermsAndConditions extends StatelessWidget {
  static const routeName = "/termsandconditions";
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Terms & Condition",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        actions: [
          GestureDetector(
            onTap:
                context.read<TermsAndConditionsViewModel>().toCustomerService,
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset("assets/icons/icon_customer_service.svg"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 1.0)
                ],
              ),
              child: ExpansionTile(
                title: const Text(
                  "About Us",
                  style: TextStyle(
                      color: Styles.colorBlack400, fontWeight: FontWeight.w500),
                ),
                iconColor: Styles.colorBlack400,
                textColor: Styles.colorBlack400,
                collapsedIconColor: Styles.colorBlack400,
                childrenPadding: const EdgeInsets.all(10),
                tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Divider(),
                      Text(
                        "JokoMart is a platform for topping up credits, data quota, and e-money. We pay special attention to convenience and comfort in transactions for our customers by continuing to develop our platform technology.",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 1.0)
                ],
              ),
              child: ExpansionTile(
                title: const Text(
                  "General Requirements",
                  style: TextStyle(
                      color: Styles.colorBlack400, fontWeight: FontWeight.w500),
                ),
                iconColor: Styles.colorBlack400,
                textColor: Styles.colorBlack400,
                collapsedIconColor: Styles.colorBlack400,
                childrenPadding: const EdgeInsets.all(10),
                tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Divider(),
                      Text(
                        "The terms and conditions on this page (Terms & Conditions of Service) bind our application users, as well as prospective buyers to comply with and comply with the matters set by JokoMart.\n\nBy using the JokoMart application, each User is deemed to have accepted, understood, agreed, and agreed to comply with all contents in the Service Terms & Conditions below. Terms & Conditions of Service can be changed and/or updated at any time by JokoMart without prior notification. If the User does not agree to these Terms & Conditions of Service, JokoMart invites the User not to continue using the JokoMart application.\n\nThe Terms and Conditions with you and JokoMart are governed by Indonesian law. By using the JokoMart application, if there is a violation of the provisions, this will become the subject of Indonesian jurisdiction.",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
