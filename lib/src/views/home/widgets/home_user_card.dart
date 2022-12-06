part of "../home_view.dart";

class HomeUserCard extends StatelessWidget {
  const HomeUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      Consumer<HomeViewModel>(builder: (context, value, child) {
                        switch (value.userState) {
                          case ViewStateType.none:
                            {
                              return Text(
                                value.user?.point == null
                                    ? "-"
                                    : NumberFormat.decimalPattern("in_ID")
                                        .format(value.user!.point),
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
              Row(
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
                          "assets/images/tier_badge_bronze.png",
                          height: 20,
                        ),
                        const Text(
                          "Bronze",
                          style: TextStyle(
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
                            child: const LinearProgressIndicator(
                              value: 5 / 20,
                              minHeight: 3,
                              color: Color(0xffD9D9D9),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xffFECC4C),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              "5.000/20.000",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Silver",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
