part of '../product_detail_view.dart';

class ProductDetailDescription extends StatelessWidget {
  const ProductDetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailViewModel>(
      builder: (context, value, child) {
        switch (value.productState) {
          case ViewStateType.loading:
            {
              return SliverToBoxAdapter(
                child: Column(
                  children: const [
                    SkeltonWidget(
                      width: double.infinity,
                      height: 24,
                      borderRadius: 8,
                      margin: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 16,
                      ),
                    ),
                    SkeltonWidget(
                      width: double.infinity,
                      height: 20,
                      borderRadius: 8,
                      margin: EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 0,
                      ),
                    ),
                    SkeltonWidget(
                      width: double.infinity,
                      height: 16,
                      borderRadius: 8,
                      margin: EdgeInsets.only(top: 32, left: 16, right: 16),
                    ),
                    SkeltonWidget(
                      width: double.infinity,
                      height: 16,
                      borderRadius: 8,
                      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                    ),
                    SkeltonWidget(
                      width: double.infinity,
                      height: 16,
                      borderRadius: 8,
                      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                    ),
                  ],
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
              String price;

              if (value.args.purchaseType == PurchaseType.buy) {
                price = value.product?.price == null
                    ? "-"
                    : NumberFormat.simpleCurrency(locale: "in_ID")
                        .format(value.product!.price);
              } else {
                price = value.product?.price == null
                    ? "-"
                    : "${NumberFormat.decimalPattern('in_ID').format(value.product!.price)} Points";
              }

              return SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            value.product?.name ?? "",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            price,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Text(value.product?.description ?? ""),
                    ),
                  ],
                ),
              );
            }

          default:
            {
              return const SliverToBoxAdapter(child: SizedBox());
            }
        }
      },
    );
  }
}
