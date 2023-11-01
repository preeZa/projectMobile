import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:projectMobile/Services.dart';
import 'package:projectMobile/models/baskets.dart';
import 'package:projectMobile/models/user.dart';
import 'package:http/http.dart' as http;

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  final int maxQuantity = 60;
  final _myBox = Hive.box("myBox");

  Baskets? baskets;
  User? user;

  bool isLoading = false;
  int quantity = 0;
  int total = 0;

  void initState() {
    super.initState();
    isLoading = true;

    parseBaskets();
  }

  void parseBaskets() {
    String data = _myBox.get('user');
    user = Services.parseUser(_myBox.get('user'));
    _myBox.put('id_user', user!.id_user);
    // print(data);

    Services.getBaskets().then((basketsFromServer) {
      setState(() {
        baskets = basketsFromServer;
        isLoading = false;
        for (int i = 0; i < baskets!.baskets.length; i++) {
          if (baskets!.baskets[i].id_user == user!.id_user) {
            int data = baskets!.baskets[i].total.toInt();
            total = total + data;
            print(total);
          }
        }
      });
    });
  }

  Future up(int id_pro) async {
    String url = "http://192.168.56.1/mobileapi/basket/up/" +
        id_pro.toString() +
        "/" +
        user!.id_user.toString();

    final reponse = await http.put(Uri.parse(url));

    if (reponse.statusCode == 200) {
      Navigator.pushNamed(context, "MyHomePage");
    }
  }

  Future down(int id_pro) async {
    String url = "http://192.168.56.1/mobileapi/basket/down/" +
        id_pro.toString() +
        "/" +
        user!.id_user.toString();

    final reponse = await http.put(Uri.parse(url));

    if (reponse.statusCode == 200) {
      Navigator.pushNamed(context, "MyHomePage");
    }
  }

  Future deleteBasket(int id_pro) async {
    String url = "http://192.168.56.1/mobileapi/basket/" +
        id_pro.toString() +
        "/" +
        user!.id_user.toString();

    print(url);
    final reponse = await http.delete(Uri.parse(url));

    if (reponse.statusCode == 200) {
      Navigator.pushNamed(context, "MyHomePage");
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
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
                for (int i = 0; i < baskets!.baskets.length; i++)
                  if (baskets!.baskets[i].id_user == user!.id_user)
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 30, right: 20),
                              // padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 170,
                              width: 170,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(baskets!.baskets[i].image),
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
                                  Text(baskets!.baskets[i].name,
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
                                            if (baskets!.baskets[i].amount <=
                                                1) {
                                              print("ddddddddddddddddd");
                                              int id_pro = baskets!
                                                  .baskets[i].id_product
                                                  .toInt();
                                              deleteBasket(id_pro);
                                            } else {
                                              int id_pro = baskets!
                                                  .baskets[i].id_product
                                                  .toInt();
                                              down(id_pro);
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: Colors.red[300],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
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
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "x" +
                                              baskets!.baskets[i].amount
                                                  .toString(),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (baskets!.baskets[i].amount >=
                                                -2) {
                                              int id_pro = baskets!
                                                  .baskets[i].id_product
                                                  .toInt();
                                              up(id_pro);
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: Colors.green[300],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
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
                                  Padding(padding: EdgeInsets.only(top: 20)),
                                  Text(
                                    "Pirce : " +
                                        baskets!.baskets[i].price.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Text(
                                    "Total : " +
                                        baskets!.baskets[i].total.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
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
                    padding: EdgeInsets.only(
                        top: 15, left: 20, right: 20, bottom: 15),
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
                        Text("Total : $total bath",
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
