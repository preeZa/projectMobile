import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:projectMobile/models/basket.dart';
import 'package:projectMobile/models/baskets.dart';

import 'package:projectMobile/models/product.dart';


import 'models/bill.dart';
import 'models/bills.dart';
import 'models/iorder.dart';
import 'models/iorders.dart';
import 'models/products.dart';
import 'models/user.dart';

class Services {
  static final _myBox = Hive.box("myBox");

  static const String url = "http://192.168.1.5/mobileapi";
  static const String url_pro = "http://192.168.1.5/mobileapi/product";

  static const String url_basket = "http://192.168.1.5/mobileapi/basket/user";
  static const String url_bill = "http://192.168.1.5/mobileapi/bill/history/";
  static const String url_Iorder = "http://192.168.1.5/mobileapi/getorder";


  static Future<Iorders> getIorders() async {
    try {
      final response = await http.get(Uri.parse(url_Iorder));
      if (200 == response.statusCode) {
        return parseIorders(response.body);
      } else {
        return Iorders();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Iorders();
    }
  }

  static Iorders parseIorders(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Iorder> iorders =
        parsed.map<Iorder>((json) => Iorder.fromJson(json)).toList();
    Iorders p = Iorders();
    p.iorders = iorders;
    return p;
  }

  static Future<Bills> getBills() async {
    try {
      final response = await http.get(Uri.parse(url_bill+_myBox.get('id_user').toString()));
      if (200 == response.statusCode) {
        return parseBills(response.body);
      } else {
        return Bills();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Bills();
    }
  }

  static Bills parseBills(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Bill> bills =
        parsed.map<Bill>((json) => Bill.fromJson(json)).toList();
    Bills p = Bills();
    p.bills = bills;
    return p;
  }

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
