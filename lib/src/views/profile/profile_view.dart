import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/views/auth/login/login_view.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottomnav_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        bottomNavigationBar:
            const BottomNavWidget(routeName: ProfileView.routeName),
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 80,
                  height: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Joko Boy",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
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
                                  "assets/images/settings_icon.png",
                                  width: 26,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Settings",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
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
                                  "assets/images/faq_logo.png",
                                  width: 26,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "FAQs",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
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
                                  "assets/images/terms_logo.png",
                                  width: 26,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Terms & Conditions",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
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
                                  "assets/images/privacy_icon.png",
                                  width: 26,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Privacy Policy",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
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
                        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: const BorderSide(color: Styles.colorBlack400),
                        ),
                      ),
                      onPressed: () async {
                        // ? move to view model
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.clear();

                        Navigator.of(context).pushNamed(LoginView.routeName);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.door_front_door_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Log Out",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Styles.colorBlack400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
