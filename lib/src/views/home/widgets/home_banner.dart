part of "../home_view.dart";

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: AspectRatio(
        aspectRatio: 361 / 81,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/banner_home.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
