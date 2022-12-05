part of "../home_view.dart";

class HomeTransactionSelectionButton extends StatelessWidget {
  const HomeTransactionSelectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const HomeSheetProductTypeList(
                    productTypeList: ProductTypeModel.productTypeList,
                  ),
                );
              },
              style: Styles.whiteButton.copyWith(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                textStyle: const MaterialStatePropertyAll(
                  TextStyle(fontSize: 14),
                ),
              ),
              child: Wrap(
                spacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/icon_product.svg"),
                  const Text("Product"),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const HomeSheetProductTypeList(
                    productTypeList: ProductTypeModel.redeemTypeList,
                  ),
                );
              },
              style: Styles.whiteButton.copyWith(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                textStyle: const MaterialStatePropertyAll(
                  TextStyle(fontSize: 14),
                ),
              ),
              child: Wrap(
                spacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/icon_redeem.svg"),
                  const Text("Redeem"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
