import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
            child: Text(
              "Profile",
              style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              height: 550,
              width: 170,
              decoration: BoxDecoration(
                color: Color.fromARGB(172, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  ProfileImg(),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Text("Username",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  // Padding(padding: EdgeInsets.only(top: 5)),
                  Text("Poploveeeeee",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 40)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                            top: 20,
                          )),
                          Text("Name : pop",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Text("Phone : 0981616960",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Container(
                            width: 320,
                            child: Text(
                                'Addres 72 : หมู่ที่ 3 ตำบลหนองขอนกว้าง อำเภอเมือง จังหวัด อุดรธานี 41000',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ProfileImg() {
    return CircleAvatar(
      radius: 100,
      backgroundImage: NetworkImage(
          'https://i.pinimg.com/564x/e6/e8/fe/e6e8fe6196d4230dc52c301deaebbf35.jpg'),
    );
  }
}
