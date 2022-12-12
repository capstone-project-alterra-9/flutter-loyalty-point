part of "../product_list_view.dart";

class ProductListInformationCard extends StatelessWidget {
  const ProductListInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<ProductListViewModel>(
        builder: (context, value, child) {
          if (!value.nextButtonDisabled) {
            return const SizedBox();
          }

          return Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffFFF9ED),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xffF3BA63),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  children: const [
                    Text(
                      "Information",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    HeroIcon(
                      HeroIcons.informationCircle,
                      style: HeroIconStyle.solid,
                      color: Color(0xffEE9D2B),
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "Before making a transaction, make sure you have entered the number and select the product.",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
