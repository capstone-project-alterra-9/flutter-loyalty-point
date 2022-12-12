enum PaymentMethodType {
  gopay("Gopay"),
  shopeePay("ShopeePay");

  const PaymentMethodType(this.value);

  final String value;
}
