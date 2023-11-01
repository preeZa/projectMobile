import 'package:flutter/material.dart';
import 'package:projectMobile/screens/home/components/new_arrival_products.dart';
import 'package:projectMobile/screens/home/home_screen.dart';
import 'package:projectMobile/screens/home/page/basketPage.dart';
import 'package:projectMobile/screens/home/page/history_page.dart';
import 'package:projectMobile/screens/home/page/intro_page.dart';
import 'package:projectMobile/screens/home/page/login_page.dart';
import 'package:projectMobile/screens/home/page/shirt_page.dart';
import 'package:projectMobile/screens/home/page/userPage.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.blue,
        fontFamily: "Gordita",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      routes: {
        "/": (context) => Intropage(),
        "LoginPage": (context) => LoginPage(),
        "basketPage": (context) => BasketPage(),
        "UserPage": (context) => UserPage(),
        "Historypage": (context) => Historypage(),
        "Shirtpage": (context) => Shirtpage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final tabs = [const HomeScreen(), const BasketPage(), const UserPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 35,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.brown,
            ),
            label: 'สินค้า',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket, color: Colors.brown),
              label: 'ตะกร้าสินค้า',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.brown),
              label: 'บัญชีของฉัน',
              backgroundColor: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
