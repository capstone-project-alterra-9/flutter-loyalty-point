part of "../home_view.dart";

class HomeTransactionOptionsButton extends StatelessWidget {
  const HomeTransactionOptionsButton({super.key});

  final List<HomeTransactionOptionModel> homeTransactionOptionList =
      HomeTransactionOptionModel.homeTransactionOptionList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        children: [
          for (int index = 0;
              index < homeTransactionOptionList.length;
              index++) ...[
            Expanded(
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
            if (index < homeTransactionOptionList.length - 1)
              const SizedBox(width: 20),
          ],
        ],
      ),
    );
  }
}
