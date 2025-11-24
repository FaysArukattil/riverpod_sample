import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_sample/models/respproducts.dart';

class ApiService {
  final String baseurl = "https://dummyjson.com";
  Logger logger = Logger();

  Future<List<Products>?> fetchproducts() async {
    Uri url = Uri.parse("$baseurl/products");

    try {
      var headers = {
        "accept": "application/json",
        "content-type": "application/json",
      };
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        logger.i(response.body);
        var json = jsonDecode(response.body);
        var plist = Respproducts.fromJson(json);
        return plist.products;
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
