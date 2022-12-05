class ProductTypeModel {
  const ProductTypeModel({required this.name, required this.icon});

  final String name;
  final String icon;

  static const List<ProductTypeModel> productTypeList = [
    ProductTypeModel(name: "Credits", icon: "assets/icons/icon_credits.svg"),
    ProductTypeModel(
        name: "Data Quota", icon: "assets/icons/icon_data_quota.svg"),
    ProductTypeModel(name: "E-money", icon: "assets/icons/icon_emoney.svg"),
  ];

  static const List<ProductTypeModel> redeemTypeList = [
    ProductTypeModel(name: "Credits", icon: "assets/icons/icon_credits.svg"),
    ProductTypeModel(
        name: "Data Quota", icon: "assets/icons/icon_data_quota.svg"),
    ProductTypeModel(name: "E-money", icon: "assets/icons/icon_emoney.svg"),
    ProductTypeModel(name: "Cashout", icon: "assets/icons/icon_cashout.svg"),
  ];
}
