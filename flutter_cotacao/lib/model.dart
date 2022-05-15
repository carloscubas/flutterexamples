class BitcoinPriceModel {
  String code;
  String symbol;
  String description;
  double value = 0.0;

  BitcoinPriceModel({
    required this.code,
    required this.symbol,
    required this.description,
    required this.value,
  });
}
