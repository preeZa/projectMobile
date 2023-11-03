import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectMobile/screens/home/components/section_title.dart';

import '../../../constants.dart';

// import '../screens/home/components/History_order/order_history.dart';

class Historypage extends StatefulWidget {
  const Historypage({Key? key}) : super(key: key);

  @override
  State<Historypage> createState() => _HistorypageState();
}

//Lastest
class _HistorypageState extends State<Historypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(192, 163, 148, 106),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
                bottom: 20,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 40,
                    color: Color.fromARGB(255, 100, 74, 33),
                  ),
                  Text(
                    "Cart",
                    style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
            for (int i = 0; i < 2; i++)
            // คอลัม
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                      child: Container(
                        height: 250,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(172, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 30, right: 20),
                              // padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 170,
                              width: 170,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(""), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 35),
                              child: Column(
                                children: [
                                  Text("Type",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Padding(padding: EdgeInsets.only(top: 7)),
                                  Text("",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "x",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    for (int j = 0; j < 4; j++)
                    // แถว
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                      child: Container(
                        height: 250,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(172, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 30, right: 20),
                              // padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 170,
                              width: 170,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(""), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 35),
                              child: Column(
                                children: [
                                  Text("Type",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Padding(padding: EdgeInsets.only(top: 7)),
                                  Text("",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "x",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ));
  }
}

Widget _gap() => const SizedBox(height: 16);
