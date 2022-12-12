part of "../home_view.dart";

class HomeUserCard extends StatelessWidget {
  const HomeUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: AspectRatio(
          aspectRatio: 361 / 150,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/background_home_card.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                // top card section
                Row(
                  children: [
                    // logo
                    Image.asset(
                      "assets/images/logo_light_app.png",
                      height: 29,
                    ),
                    const Spacer(),

                    // point
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text(
                          "Point",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Consumer<HomeViewModel>(
                            builder: (context, value, child) {
                          switch (value.userState) {
                            case ViewStateType.none:
                              {
                                return Text(
                                  value.user?.points == null
                                      ? "-"
                                      : NumberFormat.decimalPattern("in_ID")
                                          .format(value.user!.points),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                );
                              }
                            default:
                              {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                          }
                        }),
                      ],
                    )
                  ],
                ),
                const Spacer(),

                // bottom card section
                Consumer<HomeViewModel>(
                  builder: (context, value, child) {
                    int costPoints = value.user?.costPoints ?? 0;
                    int limitation = 20000;
                    String tier = "Bronze";
                    String badge = "assets/images/tier_badge_bronze.png";

                    if (costPoints.abs() >= 20000) {
                      limitation = 50000;
                      tier = "Silver";
                      badge = "assets/images/tier_badge_silver.png";
                    }

                    if (costPoints.abs() >= 50000) {
                      limitation = 100000;
                      tier = "Gold";
                      badge = "assets/images/tier_badge_gold.png";
                    }

                    return Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 5,
                            children: [
                              Image.asset(
                                badge,
                                height: 20,
                              ),
                              Text(
                                tier,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Styles.colorGreen700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),

                        // tier indicator
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(99),
                                  child: LinearProgressIndicator(
                                    value: costPoints / limitation,
                                    minHeight: 3,
                                    color: const Color(0xffD9D9D9),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      Color(0xffFECC4C),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${NumberFormat.decimalPattern("in_ID").format(costPoints)}/${NumberFormat.decimalPattern("in_ID").format(limitation)}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    tier,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),

                        // icon question
                        const HeroIcon(
                          HeroIcons.questionMarkCircle,
                          style: HeroIconStyle.solid,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
