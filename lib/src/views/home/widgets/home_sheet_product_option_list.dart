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
                4,
                (index) {
                  return Expanded(
                    child: ChangeNotifierProvider<HomeViewModel>.value(
                      value: HomeViewModel(context),
                      builder: (context, child) {
                        try {
                          if (productOptionList[index].isActive) {
                            return GestureDetector(
                              onTap: () =>
                                  context.read<HomeViewModel>().toProductList(
                                        ArgsProductListHelper(
                                          categoryProductType:
                                              productOptionList[index].name,
                                          purchaseType: productOptionList[index]
                                              .purchaseType,
                                        ),
                                      ),
                              child: cardCategoryBuilder(
                                icon: productOptionList[index].icon,
                                name: productOptionList[index].name.value,
                                isActive: productOptionList[index].isActive,
                              ),
                            );
                          }

                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context, "notActive");
                            },
                            child: cardCategoryBuilder(
                              icon: productOptionList[index].icon,
                              name: productOptionList[index].name.value,
                              isActive: productOptionList[index].isActive,
                            ),
                          );
                        } catch (e) {
                          return const SizedBox();
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardCategoryBuilder(
      {required String icon, required String name, required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
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
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                SvgPicture.asset(icon),
                const SizedBox(height: 8),
                Text(name, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ),
          if (!isActive)
            Positioned(
              right: -32,
              top: 12,
              child: Transform.rotate(
                angle: -math.pi / -4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  color: const Color(0xffFFF9ED),
                  child: const Text(
                    "Comming Soon",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 6,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
