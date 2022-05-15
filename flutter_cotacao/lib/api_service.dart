import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'constant.dart';
import 'model.dart';

class ApiService {
  Future<String?> getBitCoinPrice() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(json.decode(response.body)["bpi"].toString());
        return json.decode(response.body)["bpi"].toString();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
