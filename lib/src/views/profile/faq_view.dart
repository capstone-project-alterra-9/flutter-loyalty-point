import "package:flutter/material.dart";
import 'package:flutter_loyalty_point/src/views/profile/faqdetail_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../styles/styles.dart';
import '../../view_models/profile/faq_viewmodel.dart';

class FAQView extends StatelessWidget {
  static const routeName = "/faq";
  const FAQView({super.key});

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
            onTap: context.read<FAQViewModel>().toCustomerService,
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset("assets/icons/icon_customer_service.svg"),
            ),
          )
        ],
      ),
      body: Column(
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(FAQDetailView.routeName);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 1.0)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: const Text(
                            "Why has the product I purchased not been entered / accepted?",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Image.asset(
                          "assets/images/arrow_back.png",
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 1.0)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: const Text(
                            "What transactions can be done at Jokomart?",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Image.asset(
                          "assets/images/arrow_back.png",
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 1.0)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: const Text(
                            "Why hasn't the status of the bill changed when it has already paid ?",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Image.asset(
                          "assets/images/arrow_back.png",
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
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
                  onPressed: () {
                    Provider.of<FAQViewModel>(context, listen: false)
                        .toCustomerService();
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
    );
  }
}
