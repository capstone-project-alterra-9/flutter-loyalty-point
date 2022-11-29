import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyListView extends StatelessWidget {
  const EmptyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 252, 245, 231),
        border: Border.all(
          color: const Color.fromARGB(255, 255, 170, 0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Informasi",
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Image.asset(
                "assets/images/warning.png",
                width: 25,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Sebelum Redeem, pastikan nomor telepon anda sudah di isi.",
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
