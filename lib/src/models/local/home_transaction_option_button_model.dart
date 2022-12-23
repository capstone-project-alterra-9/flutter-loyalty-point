import 'package:flutter_loyalty_point/src/utils/types/category_product_type.dart';
import 'package:flutter_loyalty_point/src/utils/types/purchase_type.dart';

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
  const ProductOptionModel({
    required this.name,
    required this.purchaseType,
    required this.icon,
    required this.isActive,
  });

  final CategoryProductType name;
  final PurchaseType purchaseType;
  final String icon;
  final bool isActive;

  static const List<ProductOptionModel> productOptionList = [
    ProductOptionModel(
      name: CategoryProductType.credits,
      purchaseType: PurchaseType.buy,
      icon: "assets/icons/icon_credits.svg",
      isActive: true,
    ),
    ProductOptionModel(
      name: CategoryProductType.dataQuota,
      purchaseType: PurchaseType.buy,
      icon: "assets/icons/icon_data_quota.svg",
      isActive: true,
    ),
    ProductOptionModel(
      name: CategoryProductType.eMoney,
      purchaseType: PurchaseType.buy,
      icon: "assets/icons/icon_emoney.svg",
      isActive: false,
    ),
  ];

  static const List<ProductOptionModel> redeemOptionList = [
    ProductOptionModel(
      name: CategoryProductType.credits,
      purchaseType: PurchaseType.redeem,
      icon: "assets/icons/icon_credits.svg",
      isActive: true,
    ),
    ProductOptionModel(
      name: CategoryProductType.dataQuota,
      purchaseType: PurchaseType.redeem,
      icon: "assets/icons/icon_data_quota.svg",
      isActive: true,
    ),
    ProductOptionModel(
      name: CategoryProductType.eMoney,
      purchaseType: PurchaseType.redeem,
      icon: "assets/icons/icon_emoney.svg",
      isActive: false,
    ),
    ProductOptionModel(
      name: CategoryProductType.cashout,
      purchaseType: PurchaseType.redeem,
      icon: "assets/icons/icon_cashout.svg",
      isActive: false,
    ),
  ];
}
