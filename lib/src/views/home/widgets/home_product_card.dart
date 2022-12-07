part of "../home_view.dart";

class HomeProductCard extends StatelessWidget {
  const HomeProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
  });

  final String? name;
  final String? image;
  final String? category;
  final int? price;

  @override
  Widget build(BuildContext context) {
    String background;
    Positioned categoryText;
    Positioned nominalText;

    CategoryProductType categoryProductType =
        CategoryProductType.fromString(category ?? "");

    switch (categoryProductType) {
      // credits
      case CategoryProductType.credits:
        {
          background = "assets/images/background_home_card_credits.jpg";
          categoryText = Positioned(
            top: 19,
            right: 0,
            left: 0,
            child: Text(
              categoryProductType.value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          );
          nominalText = Positioned(
            left: 17,
            bottom: 19,
            child: Text(
              image ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
          break;
        }

      // data quota
      case CategoryProductType.dataQuota:
        {
          background = "assets/images/background_home_card_quota_data.jpg";
          categoryText = Positioned(
            top: 19,
            right: 0,
            left: 0,
            child: Text(
              categoryProductType.value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Styles.colorWhite,
              ),
              textAlign: TextAlign.center,
            ),
          );
          nominalText = Positioned(
            right: 15,
            bottom: 19,
            child: Text(
              image ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
          break;
        }

      // e money
      case CategoryProductType.eMoney:
        {
          background = "assets/images/background_home_card_e_money.jpg";
          categoryText = Positioned(
            top: 19,
            right: 0,
            left: 0,
            child: Text(
              categoryProductType.value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Styles.colorWhite,
              ),
              textAlign: TextAlign.center,
            ),
          );
          nominalText = Positioned(
            right: 12,
            bottom: 19,
            child: Text(
              image ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
          break;
        }

      // default
      default:
        {
          background = "assets/images/background_home_card_others.jpg";
          categoryText = Positioned(
            top: 19,
            right: 0,
            left: 0,
            child: Text(
              categoryProductType.value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Styles.colorWhite,
              ),
              textAlign: TextAlign.center,
            ),
          );
          nominalText = Positioned(
            right: 15,
            bottom: 19,
            child: Text(
              image ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
          break;
        }
    }

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image section
            SizedBox(
              height: 136,
              width: 155,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(background, fit: BoxFit.cover),
                  ),
                  categoryText,
                  nominalText,
                ],
              ),
            ),
            const SizedBox(height: 8),

            // title product
            Text(
              name ?? "",
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 2),

            // price product
            Text(
              price == null
                  ? "-"
                  : NumberFormat.simpleCurrency(locale: "in_ID").format(price),
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
