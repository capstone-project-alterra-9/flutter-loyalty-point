import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ReedemView extends StatelessWidget {
  const ReedemView({super.key});

  static const String routeName = "/reedem";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Pulsa/Paket Data",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        contentPadding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        hintText: "Phone Number",
                        hintStyle: GoogleFonts.poppins(),
                        prefix: Text("+62 ")),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 20, 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/list_paket_data.png",
                                    width: 150,
                                  )
                                ],
                              ));
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(156, 194, 155, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
