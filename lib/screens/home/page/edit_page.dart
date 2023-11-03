import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../Services.dart';
import '../../../models/user.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({Key? key}) : super(key: key);

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF765827),
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                'Edit Proflie',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10)),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://cdn-icons-png.flaticon.com/512/219/219969.png",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10)),
                          ],
                          color: Color(0xFF765827),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _gap(),
              buildTextField("Name", "Input"),
              buildTextField("Phone", "Input"),
              buildTextField("Address", "Input"),
              _gap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button('Cancel', Colors.white, Color(0xFF765827)),
                  SizedBox(width: 20),
                  Button('Confirm', Color(0xFF765827), Colors.white),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Button(String Label, Color color, Color textcolor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: color,
      ),
      child: Text(
        Label,
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 2.2,
          color: textcolor,
        ),
      ),
    );
  }

  SizedBox _gap() {
    return const SizedBox(
      height: 35,
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color(0xFF765827),
            fontWeight: FontWeight.bold,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF765827)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF765827)),
          ),
        ),
        cursorColor: Colors.brown,
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
