import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:projectMobile/screens/home/page/edit_page.dart';
import 'package:projectMobile/screens/home/page/history_page.dart';
import 'package:projectMobile/screens/home/page/login_page.dart';

import '../../../Services.dart';
import '../../../models/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _myBox = Hive.box("myBox");
  User? user;
  bool isLoading = false;

  final double coverHeight = 150;
  final double profileHeight = 130;

  @override
  void initState() {
    super.initState();
    isLoading = true;

    getUser();
  }

  void getUser() {
    String data = _myBox.get('user');
    user = Services.parseUser(_myBox.get('user'));
  }

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
                  Text(user!.username,
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
                          Text("Name : " + user!.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Text("Phone : " + user!.phone,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Container(
                            width: 320,
                            child: Text('Addres : ' + user!.addres,
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditUserPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF765827),
                        ),
                        label: Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Navigator.pushNamed(context, "Historypage");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Historypage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF765827),
                ),
                icon: Icon(
                  Icons.shopping_basket, // ไอคอนที่จะใช้
                  color: Colors.white, // สีของไอคอน
                ),
                label: Text(
                  "Purchase Order",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Navigator.pushNamed(context, "Historypage");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 63, 50, 30),
                ),
                icon: Icon(
                  Icons.exit_to_app, // ไอคอนที่จะใช้
                  color: Colors.white, // สีของไอคอน
                ),
                label: Text(
                  "ออกจากระบบ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget ProfileImg() {
    return CircleAvatar(
      radius: 100,
      backgroundImage: NetworkImage(user!.image),
    );
  }
}
