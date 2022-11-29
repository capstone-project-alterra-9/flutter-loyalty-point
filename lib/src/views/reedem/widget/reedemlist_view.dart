import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RedeemListView extends StatelessWidget {
  const RedeemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, .5), //(x,y)
                        blurRadius: 4.0,
                      ),
                    ]),
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/list_paket_data.png",
                      width: 150,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Paket Data 3GB",
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          "500 POIN",
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                ));
          }),
    );
  }
}
