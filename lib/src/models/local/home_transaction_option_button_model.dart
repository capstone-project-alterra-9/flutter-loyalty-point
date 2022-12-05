class HomeTransactionOptionModel {
  const HomeTransactionOptionModel({
    required this.name,
    required this.icon,
    required this.productOptionList,
  });

  final String name;
  final String icon;
  final List<ProductOptionModel> productOptionList;

  static const List<HomeTransactionOptionModel> homeTransactionOptionList = [
    HomeTransactionOptionModel(
      name: "Product",
      icon: "assets/icons/icon_product.svg",
      productOptionList: ProductOptionModel.productOptionList,
    ),
    HomeTransactionOptionModel(
      name: "Redeem",
      icon: "assets/icons/icon_redeem.svg",
      productOptionList: ProductOptionModel.redeemOptionList,
    ),
  ];
}

class ProductOptionModel {
  const ProductOptionModel({required this.name, required this.icon});

  final String name;
  final String icon;

  static const List<ProductOptionModel> productOptionList = [
    ProductOptionModel(
      name: "Credits",
      icon: "assets/icons/icon_credits.svg",
    ),
    ProductOptionModel(
      name: "Data Quota",
      icon: "assets/icons/icon_data_quota.svg",
    ),
    ProductOptionModel(
      name: "E-money",
      icon: "assets/icons/icon_emoney.svg",
    ),
  ];

  static const List<ProductOptionModel> redeemOptionList = [
    ProductOptionModel(
      name: "Credits",
      icon: "assets/icons/icon_credits.svg",
    ),
    ProductOptionModel(
      name: "Data Quota",
      icon: "assets/icons/icon_data_quota.svg",
    ),
    ProductOptionModel(
      name: "E-money",
      icon: "assets/icons/icon_emoney.svg",
    ),
    ProductOptionModel(
      name: "Cashout",
      icon: "assets/icons/icon_cashout.svg",
    ),
  ];
}
