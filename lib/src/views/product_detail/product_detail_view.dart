import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/views/product_list/product_list_view.dart';
import 'package:flutter_loyalty_point/src/views/reedem_status/redeem_status_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  static const String routeName = "/reedem-product-detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/product_detail.png"),
                        fit: BoxFit.cover),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      // Navigator.pushNamed(context, ReedemView.routeName);
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Paket Data 3GB",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 23),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "500 Poin",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Nikmati Paket Data 3GB/30hr dengan menukar 500 POIN",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Syarat dan Ketentuan",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Cara menikmati layanan : \n1. \n2. ",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Cara menikmati layanan : \n1. \n2. ",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "500 POIN",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            "POIN Anda tidak cukup",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(156, 194, 155, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RedeemStatusView.routeName);
                        },
                        child: Text(
                          "Redeem",
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
