part of "../home_view.dart";

class HomeSheetProductTypeList extends StatelessWidget {
  const HomeSheetProductTypeList({super.key, required this.productTypeList});

  final List<ProductTypeModel> productTypeList;

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
                productTypeList.length,
                (index) => Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.vertical,
                      children: [
                        SvgPicture.asset(
                          productTypeList[index].icon,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          productTypeList[index].name,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
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
