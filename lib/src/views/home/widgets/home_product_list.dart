part of "../home_view.dart";

class HomeProductList extends StatelessWidget {
  const HomeProductList({
    super.key,
    required this.productList,
    required this.viewState,
    required this.purchaseType,
  });

  final List<ProductModel> productList;
  final PurchaseType purchaseType;
  final ViewStateType viewState;

  @override
  Widget build(BuildContext context) {
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
          if (productList.isEmpty) {
            return const Center(
              child: Text("Product not found!"),
            );
          }

          return ListView.builder(
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 12),
              child: GestureDetector(
                onTap: () => context.read<HomeViewModel>().toProductList(
                      ArgsProductListHelper(
                        categoryProductType: CategoryProductType.fromString(
                          productList[index].category ?? "",
                        ),
                        purchaseType: purchaseType,
                        productId: productList[index].id,
                      ),
                    ),
                child: HomeProductCard(
                  name: productList[index].name,
                  image: productList[index].image,
                  category: productList[index].category,
                  price: productList[index].price,
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
