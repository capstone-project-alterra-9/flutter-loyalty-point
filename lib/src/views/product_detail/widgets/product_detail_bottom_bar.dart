part of '../product_detail_view.dart';

class ProductDetailBottomBar extends StatelessWidget {
  const ProductDetailBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Styles.colorBlack50)),
        ),
        child: Consumer<ProductDetailViewModel>(
          builder: (context, value, child) {
            switch (value.productState) {
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

                  return Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Your Payment"),
                            Text(
                              price,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: Styles.primaryButton,
                          child: Text(value.args.purchaseType.value),
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
    );
  }
}
