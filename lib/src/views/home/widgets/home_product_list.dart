part of "../home_view.dart";

class HomeProductList extends StatelessWidget {
  const HomeProductList({
    super.key,
    required this.productList,
    required this.title,
    required this.viewState,
    required this.purchaseType,
  });

  final String title;
  final List<ProductModel> productList;
  final PurchaseType purchaseType;
  final ViewStateType viewState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
            bottom: 8,
          ),
          child: Row(
            children: [
              Text(
                "$title Recommend",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text("See All $title", style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 16),
          child: SizedBox(
            height: 206,
            child: productListBuilder(),
          ),
        ),
      ],
    );
  }

  Widget productListBuilder() {
    switch (viewState) {
      case ViewStateType.loading:
        {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

      case ViewStateType.error:
        {
          return const Center(
            child: Text("Something went wrong!"),
          );
        }

      case ViewStateType.none:
        {
          return ListView.builder(
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 12),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                child: GestureDetector(
                  onTap: () => context.read<HomeViewModel>().toProductList(
                        ArgsProductListHelper(
                          categoryProductType: CategoryProductType.fromString(
                            productList[index].category ?? "others",
                          ),
                          purchaseType: purchaseType,
                          productId: productList[index].id,
                        ),
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            productList[index].image!,
                            height: 136,
                            width: 155,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const SizedBox(
                              height: 136,
                              width: 155,
                              child: Center(
                                child: Text(
                                  "Image\nNot Found!",
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          productList[index].name!,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: "in_ID")
                              .format(productList[index].price!),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }

      default:
        {
          return const SizedBox();
        }
    }
  }
}
