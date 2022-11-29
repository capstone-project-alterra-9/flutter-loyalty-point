import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/views/auth/login/login_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  static const routeName = "/profile";
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: ListTile(
          leading: Image.asset(
            "assets/images/jokomart_appbar.png",
            width: 80,
          ),
        ),
        titleSpacing: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: Colors.black,
          )
        ],
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100)),
              width: 70,
              height: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Joko Boy",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, .5), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ]),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/membership.png",
                              width: 26,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "My Membership",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, .5), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ]),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/membership.png",
                              width: 26,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "My Membership",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, .5), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ]),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/membership.png",
                              width: 26,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "My Membership",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, .5), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ]),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/membership.png",
                              width: 26,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "My Membership",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, .5), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ]),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/membership.png",
                              width: 26,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "My Membership",
                              style: GoogleFonts.poppins(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(156, 194, 155, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginView.routeName);
                  },
                  child: Text(
                    "Log Out",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
