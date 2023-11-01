import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectMobile/models/product.dart';

import 'models/products.dart';

class Services {
  static const String url = "http://192.168.56.1/mobileapi";
  static const String url_pro = "http://192.168.56.1/mobileapi/product";
  
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
    List<Product> products = parsed.map<Product>((json) => Product.fromJson(json)).toList();
    Products p = Products();
    p.products = products;
    return p;
  }


}
