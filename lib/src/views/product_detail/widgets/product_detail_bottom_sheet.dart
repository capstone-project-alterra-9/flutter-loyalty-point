part of '../product_detail_view.dart';

class ProductDetailBottomSheet extends StatelessWidget {
  const ProductDetailBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
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

                final int stock = value.product?.stock ?? 0;

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
                    value.createTransactionState == ViewStateType.loading ||
                            value.checkIsUserPointsEnoughState ==
                                    ViewStateType.loading &&
                                value.args.purchaseType == PurchaseType.redeem
                        ? Expanded(
                            child: ElevatedButton(
                              onPressed: null,
                              style: Styles.primaryButton,
                              child: const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ElevatedButton(
                              onPressed: value.createTransactionButtonDisabled
                                  ? null
                                  : context
                                      .read<ProductDetailViewModel>()
                                      .createTransaction,
                              style: Styles.primaryButton,
                              child: Text(
                                stock <= 0
                                    ? "Out of Stock"
                                    : value.createTransactionButtonDisabled
                                        ? "Not Enough"
                                        : value.args.purchaseType.value,
                              ),
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
    );
  }
}
