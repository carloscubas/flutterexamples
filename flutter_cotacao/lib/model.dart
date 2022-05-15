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

  factory BitcoinPriceModel.fromJson(Map<String, dynamic> json) =>
      BitcoinPriceModel(
        code: json["code"],
        symbol: json["symbol"],
        description: json["description"],
        value: json["rate_float"],
      );
}
