part of '../product_detail_view.dart';

class ProductDetailBottomSheet extends StatelessWidget {
  const ProductDetailBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      child: Consumer<ProductDetailViewModel>(
        builder: (context, value, child) {
          switch (value.checkIsUserPointsEnoughState) {
            case ViewStateType.loading:
              {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SkeltonWidget(
                            width: 100,
                            height: 14,
                            borderRadius: 4,
                            margin: EdgeInsets.only(bottom: 4),
                          ),
                          SkeltonWidget(
                            width: 150,
                            height: 16,
                            borderRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SkeltonWidget(
                      width: 100,
                      height: 32,
                      borderRadius: 20,
                      margin: EdgeInsets.only(left: 100),
                    ),
                  ],
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
                    Expanded(
                      child: ElevatedButton(
                        onPressed: value.createTransactionButtonDisabled ||
                                value.createTransactionState ==
                                    ViewStateType.loading ||
                                value.createTransactionState ==
                                    ViewStateType.error
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
