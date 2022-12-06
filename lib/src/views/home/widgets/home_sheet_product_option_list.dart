part of "../home_view.dart";

class HomeSheetProductOptionList extends StatelessWidget {
  const HomeSheetProductOptionList({
    super.key,
    required this.productOptionList,
  });

  final List<ProductOptionModel> productOptionList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 160,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 5,
                width: 60,
                margin: const EdgeInsets.only(bottom: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: const Color(0xffA8A8A8),
                ),
              ),
            ),
            Row(
              children: List.generate(
                productOptionList.length,
                (index) => Expanded(
                  child: ChangeNotifierProvider<HomeViewModel>.value(
                    value: HomeViewModel(context),
                    builder: (context, child) => GestureDetector(
                      onTap: () => context.read<HomeViewModel>().toProductList(
                            ArgsProductListHelper(
                              categoryProductType:
                                  productOptionList[index].name,
                              purchaseType:
                                  productOptionList[index].purchaseType,
                            ),
                          ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Styles.colorBlack500.withOpacity(0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.vertical,
                          children: [
                            SvgPicture.asset(
                              productOptionList[index].icon,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              productOptionList[index].name.value,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
