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
          return ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SkeltonWidget(
                  width: 150,
                  height: 150,
                  borderRadius: 8,
                  margin: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 4,
                    top: 8,
                  ),
                ),
                SkeltonWidget(
                  width: 100,
                  height: 14,
                  borderRadius: 8,
                  margin: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 2,
                  ),
                ),
                SkeltonWidget(
                  width: 125,
                  height: 14,
                  borderRadius: 8,
                  margin: EdgeInsets.only(
                    left: 12,
                  ),
                ),
              ],
            ),
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
