import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:projectMobile/main.dart';
import 'package:projectMobile/screens/home/components/categories.dart';
import 'package:projectMobile/screens/home/components/section_title.dart';

import '../../../Services.dart';
import '../../../constants.dart';
import '../../../models/bills.dart';
import '../../../models/iorders.dart';

// import '../screens/home/components/History_order/order_history.dart';

class Historypage extends StatefulWidget {
  const Historypage({Key? key}) : super(key: key);

  @override
  State<Historypage> createState() => _HistorypageState();
}

//Lastest
class _HistorypageState extends State<Historypage> {
  Bills? bills;
  Iorders? iorders;
  bool isLoading = false;
  int num = 1;
  final _myBox = Hive.box("myBox");

  void initState() {
    super.initState();
    isLoading = true;
    bills = Bills();

    Services.getBills().then((billsFromServer) {
      setState(() {
        bills = billsFromServer;
        isLoading = false;
      });
    });
    Services.getIorders().then((iordersFromServer) {
      setState(() {
        iorders = iordersFromServer;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(192, 163, 148, 106),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history),
                  const SizedBox(width: defaultPadding / 2),
                  Text(
                    "HISTORY",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
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
                      Text(
                        "Cart History",
                        style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < bills!.bills.length; i++)
                  // คอลัม
                  SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 10)),
                              Text(
                                "Order " + bills!.bills[i].numberrow.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 140, right: 15, bottom: 10)),
                              Text(
                                "Total " + bills!.bills[i].total.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              )
                            ],
                          ),
                        ),
                        
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 20)),
                                  
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int j = 0; j < iorders!.iorders.length; j++)
                               if(bills!.bills[i].id_bill==iorders!.iorders[j].id_bill)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 20),
                                child: Container(
                                  height: 200,
                                  width: 260,
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
                                            top: 10,
                                            bottom: 10,
                                            left: 20,
                                            right: 10),
                                        // padding: EdgeInsets.symmetric(horizontal: 20),
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  iorders!.iorders[j].image),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            bottom: 10,
                                            right: 30,
                                            top: 50),
                                        child: Column(
                                          children: [
                                            Text("Type",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 7)),
                                            Text(iorders!.iorders[j].name,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10)),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text(
                                                "x"+iorders!.iorders[j].amount.toString(),
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 7)),
                                            Text("Price "+iorders!.iorders[j].sum.toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 58, 49, 49))),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // for (int j = 0; j < iorders!.iorders.length; j++)
                              //   // if(bills!.bills[i].id_bill==iorders!.iorders[i].id_bill)
                              //   // แถว
                              //   Padding(
                              //     padding: EdgeInsets.only(
                              //         left: 15, right: 15, bottom: 20),
                              //     child: Container(
                              //       height: 200,
                              //       width: 260,
                              //       decoration: BoxDecoration(
                              //         color: Color.fromARGB(172, 255, 255, 255),
                              //         borderRadius: BorderRadius.only(
                              //             topLeft: Radius.circular(35),
                              //             topRight: Radius.circular(35),
                              //             bottomLeft: Radius.circular(35),
                              //             bottomRight: Radius.circular(35)),
                              //       ),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.start,
                              //         children: [
                              //           Container(
                              //             margin: EdgeInsets.only(
                              //                 top: 10,
                              //                 bottom: 10,
                              //                 left: 30,
                              //                 right: 20),
                              //             // padding: EdgeInsets.symmetric(horizontal: 20),
                              //             height: 80,
                              //             width: 80,
                              //             decoration: BoxDecoration(
                              //               image: DecorationImage(
                              //                   image: NetworkImage(
                              //                       iorders!.iorders[i].image),
                              //                   fit: BoxFit.cover),
                              //               borderRadius:
                              //                   BorderRadius.circular(20),
                              //             ),
                              //           ),
                              //           Padding(
                              //             padding: EdgeInsets.only(
                              //                 left: 20,
                              //                 bottom: 10,
                              //                 right: 30,
                              //                 top: 50),
                              //             child: Column(
                              //               children: [
                              //                 Text("Type",
                              //                     style: TextStyle(
                              //                         fontSize: 20,
                              //                         fontWeight:
                              //                             FontWeight.bold,
                              //                         color: Colors.black)),
                              //                 Padding(
                              //                     padding:
                              //                         EdgeInsets.only(top: 7)),
                              //                 Text(iorders!.iorders[i].name,
                              //                     style: TextStyle(
                              //                         fontSize: 12,
                              //                         fontWeight:
                              //                             FontWeight.bold,
                              //                         color: Colors.black)),
                              //                 Padding(
                              //                     padding:
                              //                         EdgeInsets.only(top: 10)),
                              //                 Container(
                              //                   margin: EdgeInsets.symmetric(
                              //                       horizontal: 10),
                              //                   child: Text(
                              //                     "x" +
                              //                         iorders!.iorders[i].amount
                              //                             .toString(),
                              //                     style:
                              //                         TextStyle(fontSize: 12),
                              //                   ),
                              //                 ),
                              //                 Padding(
                              //                     padding:
                              //                         EdgeInsets.only(top: 7)),
                              //                 Text(
                              //                     "Price " +
                              //                         iorders!.iorders[i].sum
                              //                             .toString(),
                              //                     style: TextStyle(
                              //                         fontSize: 12,
                              //                         fontWeight:
                              //                             FontWeight.bold,
                              //                         color:
                              //                             const Color.fromARGB(
                              //                                 255,
                              //                                 58,
                              //                                 49,
                              //                                 49))),
                              //                 Padding(
                              //                     padding:
                              //                         EdgeInsets.only(top: 10)),
                              //               ],
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                            ],
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
