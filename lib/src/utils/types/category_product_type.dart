enum CategoryProductType {
  credits("Credits"),
  dataQuota("Data Quota"),
  eMoney("E-Money"),
  cashout("Cashout"),
  other("Other"),
  ;

  const CategoryProductType(this.value);

  factory CategoryProductType.fromString(String value) {
    switch (value.toLowerCase()) {
      case "credits":
        {
          return CategoryProductType.credits;
        }
      case "data quota":
        {
          return CategoryProductType.dataQuota;
        }
      case "e-money":
        {
          return CategoryProductType.eMoney;
        }
      case "cashout":
        {
          return CategoryProductType.cashout;
        }
      default:
        {
          return CategoryProductType.other;
        }
    }
  }

  final String value;
}
