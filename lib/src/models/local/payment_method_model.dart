import 'package:flutter_loyalty_point/src/utils/types/payment_method_type.dart';

class PaymentMethodModel {
  const PaymentMethodModel({
    required this.name,
    required this.icon,
  });

  final PaymentMethodType name;
  final String icon;

  static const List<PaymentMethodModel> paymentMethodList = [
    PaymentMethodModel(
        name: PaymentMethodType.gopay,
        icon: "assets/images/icon_payment_method_gopay.jpg"),
    PaymentMethodModel(
        name: PaymentMethodType.shopeePay,
        icon: "assets/images/icon_payment_method_shopeepay.jpg"),
  ];
}
