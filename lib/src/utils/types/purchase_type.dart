enum PurchaseType {
  buy("Buy"),
  redeem("Redeem");

  const PurchaseType(this.value);

  final String value;

  String toPath() => value.toLowerCase();
}
