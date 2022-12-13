part of '../product_list_view.dart';

class ProductListProductList extends StatelessWidget {
  const ProductListProductList({super.key});

  @override
  Widget build(BuildContext context) {
    ProductListViewModel productListViewModel =
        context.read<ProductListViewModel>();

    return Consumer<ProductListViewModel>(
      builder: (context, value, child) {
        switch (value.productListState) {
          case ViewStateType.loading:
            {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 2,
                  (context, index) => Row(
                    children: [
                      const Expanded(
                        child: SkeltonWidget(
                          width: double.infinity,
                          height: 100,
                          borderRadius: 16,
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            SkeltonWidget(
                              width: double.infinity,
                              height: 32,
                              borderRadius: 8,
                              margin: EdgeInsets.only(
                                right: 16,
                                bottom: 8,
                              ),
                            ),
                            SkeltonWidget(
                              width: double.infinity,
                              height: 32,
                              borderRadius: 8,
                              margin: EdgeInsets.only(
                                right: 64,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

          case ViewStateType.error:
            {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text("Something went wrong!"),
                ),
              );
            }

          case ViewStateType.none:
            {
              if (value.productList.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Product not found!",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: value.productList.length + 1,
                  (context, index) {
                    return index == value.productList.length
                        ? const SizedBox(height: 120)
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: GestureDetector(
                              onTap: () => productListViewModel.tapProduct(
                                value.productList[index].id,
                              ),
                              child: ProductListProductCard(
                                name: value.productList[index].name,
                                image: value.productList[index].image,
                                category: value.productList[index].category,
                                price: value.productList[index].price,
                                activeCard: value.productList[index].id ==
                                    value.args.productId,
                              ),
                            ),
                          );
                  },
                ),
              );
            }

          default:
            {
              return const SliverToBoxAdapter();
            }
        }
      },
    );
  }
}
