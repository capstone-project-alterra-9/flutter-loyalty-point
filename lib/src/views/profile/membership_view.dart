import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/profile/mymembership_viewmodel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MembershipView extends StatelessWidget {
  static const routeName = "/membership";
  const MembershipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "User Level",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset("assets/icons/icon_customer_service.svg"),
            ),
          )
        ],
      ),
      body: Consumer<MyMembershipViewModel>(builder: (context, value, child) {
        switch (value.userState) {
          default:
            int costPoints = value.user?.costPoints ?? 0;
            int limitation = 20000;
            String tier = "Bronze";
            String badge = "assets/images/tier_badge_bronze.png";
            if (costPoints.abs() >= 20000) {
              tier = "Silver";
              badge = "assets/images/tier_badge_silver.png";
              limitation = 50000;
            } else if (costPoints.abs() >= 10000) {
              tier = "Gold";
              badge = "assets/images/tier_badge_gold.png";
              limitation = 100000;
            }
            return Padding(
              padding: const EdgeInsets.fromLTRB(25, 45, 25, 0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        badge,
                        width: 50,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "You are a jokomart",
                            style: TextStyle(
                                color: Styles.colorBlack200, fontSize: 11),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                tier.toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Text(
                                "USER",
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 2.0)
                                  ]),
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/tier_badge_bronze.png",
                                  width: 25,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Bronze",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Styles.colorBlack300,
                                  fontSize: 15),
                            ),
                            const Text(
                              "0 PTS",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Styles.colorBlack200,
                                  fontSize: 13),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 2.0)
                                  ]),
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/tier_badge_silver.png",
                                  width: 25,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Silver",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Styles.colorBlack300,
                                  fontSize: 15),
                            ),
                            const Text(
                              "20.000 PTS",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Styles.colorBlack200,
                                  fontSize: 13),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 2.0)
                                  ]),
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/tier_badge_gold.png",
                                  width: 25,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Gold",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Styles.colorBlack300,
                                  fontSize: 15),
                            ),
                            const Text(
                              "100.000 PTS",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Styles.colorBlack200,
                                  fontSize: 13),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Redeeming points won’t affect your progress to the next level",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Styles.colorBlack200,
                        fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 2.0)
                          ]),
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "How it works",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Styles.colorBlack400,
                                fontSize: 15),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/howitworks_1.png"),
                            ),
                            title: const Text(
                              "You will earn 5% points for every spend on JokoMart.",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Styles.colorBlack300),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/howitworks_1.png"),
                            ),
                            title: const Text(
                              "Use your points to redeem exciting deals and promotions.",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Styles.colorBlack300),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/howitworks_1.png"),
                            ),
                            title: const Text(
                              "Earn enough points and level up to unlock exclusive benefits.",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Styles.colorBlack300),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            );
        }
      }),
    );
  }
}
