import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  int quantity = 0;
  final int maxQuantity = 60;

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
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(172, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 30, bottom: 30, left: 30, right: 20),
                    // padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.pinimg.com/564x/48/19/23/481923e92d2d95abb6218d78964a52c8.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      children: [
                        Text("Type",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Padding(padding: EdgeInsets.only(top: 7)),
                        Text("Shirts",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                  } else {
                                    quantity = 1;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.red[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      )
                                    ]),
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 16,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "x$quantity",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quantity < maxQuantity) {
                                    quantity++;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.green[300],
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      )
                                    ]),
                                child: Icon(
                                  CupertinoIcons.plus,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          "Pirce : 400",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Container(
                  padding:
                      EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(172, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35)),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Total : 2000 bath",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, "LoginPage");
                            Navigator.pushNamed(context, "Historypage");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 123, 90, 43),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart, // ไอคอนที่จะใช้
                                  color: Colors.white, // สีของไอคอน
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Pay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]))),
        ],
      ),
    );
  }
}
