import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/view_models/profile/profile_viewmodel.dart';
import 'package:flutter_loyalty_point/src/views/auth/login/login_view.dart';
import 'package:flutter_loyalty_point/src/views/profile/faq_view.dart';
import 'package:flutter_loyalty_point/src/views/profile/membership_view.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottomnav_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {},
                child:
                    SvgPicture.asset("assets/icons/icon_customer_service.svg"),
              ),
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Styles.colorGreen500,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 80,
                  height: 80,
                  child: Center(
                    child: const Text(
                      "J",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Jokoboys",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Styles.colorGreen900),
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(MembershipView.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.0,
                              ),
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ),
                            const Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(FAQView.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.0,
                              ),
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ),
                            const Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<ProfileViewModel>(context, listen: false)
                            .showSnackBar(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.0,
                              ),
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ),
                            const Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<ProfileViewModel>(context, listen: false)
                            .showSnackBar(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.0,
                              ),
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ),
                            const Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<ProfileViewModel>(context, listen: false)
                            .showSnackBar(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.0,
                              ),
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ),
                            const Icon(Icons.keyboard_arrow_right_outlined)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: const BorderSide(color: Styles.colorBlack400),
                        ),
                      ),
                      onPressed: () async {
                        // ? move to view model
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              titlePadding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 30, right: 30),
                              contentPadding: const EdgeInsets.only(
                                  bottom: 13, left: 30, right: 30),
                              title: const Text(
                                'Log Out?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 18),
                              ),
                              content: const Text(
                                "Are you sure want to logout?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, color: Styles.colorBlack300),
                              ),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 10,
                                        ),
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          side: const BorderSide(
                                              color: Styles.colorGreen500),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: GoogleFonts.poppins(
                                            color: Styles.colorGreen500,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    ElevatedButton(
                                      style: Styles.primaryButton,
                                      onPressed: () async {
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.clear();

                                        Navigator.of(context)
                                            .pushNamed(LoginView.routeName);
                                      },
                                      child: Text('Log Out',
                                          style: GoogleFonts.poppins()),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        );
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
