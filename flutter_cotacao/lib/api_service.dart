import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'constant.dart';
import 'model.dart';

class ApiService {
  Future<List<BitcoinPriceModel>?> getBitCoinPrice() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        BitcoinPriceModel dollar = BitcoinPriceModel.fromJson(
            json.decode(response.body)["bpi"]["USD"]);
        BitcoinPriceModel euro = BitcoinPriceModel.fromJson(
            json.decode(response.body)["bpi"]["EUR"]);
        BitcoinPriceModel libras = BitcoinPriceModel.fromJson(
            json.decode(response.body)["bpi"]["GBP"]);
        var _model = [dollar, euro, libras];
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
