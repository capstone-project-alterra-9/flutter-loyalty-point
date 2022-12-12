part of "../payment_view.dart";

class PaymentProductCard extends StatelessWidget {
  const PaymentProductCard({
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
          background = "assets/images/background_product_list_card_credits.jpg";
          categoryText = Positioned(
            top: 5,
            right: 0,
            left: 0,
            child: Text(
              categoryProductType.value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          );
          nominalText = Positioned(
            left: 20,
            bottom: 10,
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
          background =
              "assets/images/background_product_list_card_quota_data.jpg";
          categoryText = Positioned(
            top: 5,
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
            right: 20,
            bottom: 10,
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
          background = "assets/images/background_product_list_card_e_money.jpg";
          categoryText = Positioned(
            top: 5,
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
            right: 20,
            bottom: 10,
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
          background = "assets/images/background_product_list_card_others.jpg";
          categoryText = Positioned(
            top: 5,
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
            right: 20,
            bottom: 10,
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
      color: Styles.colorWhite,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // image section
              SizedBox(
                height: 104,
                width: 181,
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
              const SizedBox(width: 8),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title product
                    Text(
                      name ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),

                    // price product
                    Text(
                      NumberFormat.simpleCurrency(locale: "in_ID").format(
                        price,
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}