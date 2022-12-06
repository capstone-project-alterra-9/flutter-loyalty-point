part of "../home_view.dart";

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          children: [
            // leading section
            Expanded(
              child: Consumer<HomeViewModel>(
                builder: (context, value, child) {
                  switch (value.userState) {
                    case ViewStateType.none:
                      {
                        return Wrap(
                          spacing: 16,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            // icon user
                            const HeroIcon(
                              HeroIcons.userCircle,
                              style: HeroIconStyle.solid,
                              size: 45,
                              color: Styles.colorGreen500,
                            ),

                            // user name
                            Text(
                              "Hi, ${value.user?.username ?? ''}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }
                    default:
                      {
                        return const SizedBox();
                      }
                  }
                },
              ),
            ),

            // icon section
            const HeroIcon(
              HeroIcons.bell,
              style: HeroIconStyle.solid,
              size: 24,
              color: Styles.colorBlack400,
            ),
          ],
        ),
      ),
    );
  }
}
