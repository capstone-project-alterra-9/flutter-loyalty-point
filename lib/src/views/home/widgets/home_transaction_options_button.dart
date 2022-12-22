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
                  onPressed: () async {
                    ScaffoldFeatureController showSnackbar() =>
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBarWidget(
                                  title: "Service not available",
                                  subtitle:
                                      "Sorry, the service you selected is currently under development",
                                  snackBarType: SnackBarType.warning)
                              .build(context),
                        );

                    String? args = await showModalBottomSheet(
                      context: context,
                      builder: (context) => HomeSheetProductOptionList(
                        productOptionList:
                            homeTransactionOptionList[index].productOptionList,
                      ),
                    );

                    if (args == "notActive") {
                      showSnackbar();
                    }
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
