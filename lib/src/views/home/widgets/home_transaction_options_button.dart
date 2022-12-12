part of "../home_view.dart";

class HomeTransactionOptionsButton extends StatelessWidget {
  const HomeTransactionOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeTransactionOptionModel> homeTransactionOptionList =
        context.read<HomeViewModel>().homeTransactionOptionList;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: List.generate(
            homeTransactionOptionList.length,
            (index) => Expanded(
              child: Padding(
                padding: index < homeTransactionOptionList.length - 1
                    ? const EdgeInsets.only(right: 20)
                    : const EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => HomeSheetProductOptionList(
                        productOptionList:
                            homeTransactionOptionList[index].productOptionList,
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
                      SvgPicture.asset(homeTransactionOptionList[index].icon),
                      Text(homeTransactionOptionList[index].name),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
