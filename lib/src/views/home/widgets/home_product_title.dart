part of "../home_view.dart";

class HomeProductTitle extends StatelessWidget {
  const HomeProductTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          right: 16,
          left: 16,
          bottom: 8,
        ),
        child: Text(
          "$title Recommend",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
