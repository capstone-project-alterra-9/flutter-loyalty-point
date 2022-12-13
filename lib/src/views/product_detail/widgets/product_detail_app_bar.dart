part of '../product_detail_view.dart';

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Consumer<ProductDetailViewModel>(
          builder: (context, value, child) => HeroIcon(
            HeroIcons.arrowLeft,
            style: HeroIconStyle.outline,
            size: 24,
            color: value.product?.category == "e-money"
                ? Styles.colorWhite
                : Styles.colorBlack400,
          ),
        ),
      ),
      expandedHeight: 367 / 393 * width - 56,
      flexibleSpace: Consumer<ProductDetailViewModel>(
        builder: (context, value, child) {
          switch (value.productState) {
            case ViewStateType.loading:
              {
                return const SkeltonWidget(
                  width: double.infinity,
                  height: double.infinity,
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
                String background;
                Positioned categoryText;
                Positioned nominalText;
                int topDistance = 0;
                int nominalTextLength = value.product?.image?.length ?? 4;

                CategoryProductType categoryProductType =
                    CategoryProductType.fromString(
                  value.product?.category ?? "",
                );

                if (Platform.isAndroid) {
                  topDistance = -24;
                }

                switch (categoryProductType) {
                  // credits
                  case CategoryProductType.credits:
                    {
                      background =
                          "assets/images/background_product_detail_card_credits.jpg";
                      categoryText = Positioned(
                        top: 86 / 393 * width + topDistance,
                        right: 0,
                        left: 0,
                        bottom: 60 / 393 * width,
                        child: Text(
                          categoryProductType.value,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32 / 393 * width,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                      nominalText = Positioned(
                        left: 54 / 393 * width,
                        bottom: 60 / 393 * width,
                        child: Text(
                          value.product?.image ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 48 / 393 * width * 4 / nominalTextLength,
                          ),
                        ),
                      );
                      break;
                    }

                  // data quota
                  case CategoryProductType.dataQuota:
                    {
                      background =
                          "assets/images/background_product_detail_card_quota_data.jpg";
                      categoryText = Positioned(
                        top: 86 / 393 * width + topDistance,
                        right: 0,
                        left: 0,
                        bottom: 60 / 393 * width,
                        child: Text(
                          categoryProductType.value,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32 / 393 * width,
                            color: Styles.colorWhite,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                      nominalText = Positioned(
                        right: 54 / 393 * width,
                        bottom: 60 / 393 * width,
                        child: Text(
                          value.product?.image ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 48 / 393 * width * 4 / nominalTextLength,
                          ),
                        ),
                      );
                      break;
                    }

                  // e money
                  case CategoryProductType.eMoney:
                    {
                      background =
                          "assets/images/background_product_detail_card_e_money.jpg";
                      categoryText = Positioned(
                        top: 86 / 393 * width + topDistance,
                        right: 0,
                        left: 0,
                        bottom: 60 / 393 * width,
                        child: Text(
                          categoryProductType.value,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32 / 393 * width,
                            color: Styles.colorWhite,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                      nominalText = Positioned(
                        right: 54 / 393 * width,
                        bottom: 60 / 393 * width,
                        child: Text(
                          value.product?.image ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 48 / 393 * width * 4 / nominalTextLength,
                          ),
                        ),
                      );
                      break;
                    }

                  // default
                  default:
                    {
                      background =
                          "assets/images/background_product_detail_card_others.jpg";
                      categoryText = Positioned(
                        top: 86 / 393 * width + topDistance,
                        right: 0,
                        left: 0,
                        bottom: 60 / 393 * width,
                        child: Text(
                          categoryProductType.value,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32 / 393 * width,
                            color: Styles.colorWhite,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                      nominalText = Positioned(
                        right: 54 / 393 * width,
                        bottom: 60 / 393 * width,
                        child: Text(
                          value.product?.image ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 48 / 393 * width * 4 / nominalTextLength,
                          ),
                        ),
                      );
                      break;
                    }
                }

                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(background, fit: BoxFit.cover),
                    ),
                    categoryText,
                    nominalText,
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
