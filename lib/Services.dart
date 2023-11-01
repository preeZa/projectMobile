import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:projectMobile/models/product.dart';

import 'models/products.dart';
import 'models/user.dart';

class Services {
  static final _myBox = Hive.box("myBox");

  static const String url = "http://192.168.56.1/mobileapi";
  static const String url_pro = "http://192.168.56.1/mobileapi/product";
  static const String url_user = "http://192.168.56.1/mobileapi/product/1";

  static Future<Products> getProducts() async {
    try {
      final response = await http.get(Uri.parse(url_pro));
      if (200 == response.statusCode) {
        return parseProducts(response.body);
      } else {
        return Products();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Products();
    }
  }

  static Products parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Product> products =
        parsed.map<Product>((json) => Product.fromJson(json)).toList();
    Products p = Products();
    p.products = products;
    return p;
  }
}
