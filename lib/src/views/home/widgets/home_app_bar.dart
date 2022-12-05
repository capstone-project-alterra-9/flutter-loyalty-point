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
              child: Wrap(
                spacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // user image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1631588310958-dec1630f8df5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1527&q=80",
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // user name
                  const Text(
                    "Hi, Joko",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
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
