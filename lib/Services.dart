import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:projectMobile/models/basket.dart';
import 'package:projectMobile/models/baskets.dart';

import 'package:projectMobile/models/product.dart';


import 'models/products.dart';
import 'models/user.dart';

class Services {
  static final _myBox = Hive.box("myBox");

  static const String url = "http://192.168.1.5/mobileapi";
  static const String url_pro = "http://192.168.1.5/mobileapi/product";
  static const String url_user = "http://192.168.1.5/mobileapi/product/1";
  static const String url_basket = "http://192.168.1.5/mobileapi/basket/user";

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

  static Future<Baskets> getBaskets() async {
      try {
        final response = await http.get(Uri.parse(url_basket));
        if (200 == response.statusCode) {
          return parseBaskets(response.body);
        } else {
          return Baskets();
        }
      } catch (e) {
        print('Error ${e.toString()}');
        return Baskets();
      }
    }

    static Baskets parseBaskets(String responseBody) {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      List<Basket> baskets =
          parsed.map<Basket>((json) => Basket.fromJson(json)).toList();
      Baskets p = Baskets();
      p.baskets = baskets;
      return p;
  }
  

  static User parseUser(String responseBody) {
    final Map<String, dynamic> parsed = json.decode(responseBody);
    return User.fromJson(parsed);
  }
}
