import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/views/home/bottomnav_view.dart';
import 'package:flutter_loyalty_point/src/views/home/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

class RedeemStatusView extends StatefulWidget {
  const RedeemStatusView({super.key});
  static const routeName = "redeem-status";

  @override
  State<RedeemStatusView> createState() => _RedeemStatusViewState();
}

class _RedeemStatusViewState extends State<RedeemStatusView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), (() {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(BottomNavView.routeName, (route) => false);
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/redeem_success.png",
                width: 330,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Selamat",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Anda telah berhasil melakukan\nredeem poin",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Anda akan diarahkan ke homepage..",
                style: GoogleFonts.poppins(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
