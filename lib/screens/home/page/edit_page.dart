import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:projectMobile/main.dart';
import 'package:projectMobile/screens/home/page/userPage.dart';

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

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  final double coverHeight = 150;
  final double profileHeight = 130;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    if (_myBox.get('user') != null) {
      getUser();
    }
  }

  void getUser() {
    String data = _myBox.get('user');
    user = Services.parseUser(_myBox.get('user'));
    _nameController.text = user!.name;
    _phoneController.text = user!.phone;
    _addressController.text = user!.addres;
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
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
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
                      top: 90,
                      bottom: 0,
                      right: 0,
                      left: 80,
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
                        child: IconButton(
                          padding: EdgeInsetsDirectional.only(top: 0),
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _gap(),
              buildTextField("Name", "Input", _nameController),
              buildTextField("Phone", "Input", _phoneController),
              buildTextField("Address", "Input", _addressController),
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

  Widget buildTextField(
      String labelText, String placeholder, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextFormField(
        controller: controller,
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
        validator: (value) => validateUsernameOrPhone(value, labelText),
      ),
    );
  }

  String? validateUsernameOrPhone(String? value, String labelText) {
    if (labelText == "Name" || labelText == "Phone") {
      if (value == null || value.isEmpty) {
        return 'Please enter your $labelText.';
      }
    }
    return null;
  }

  Widget ProfileImg() {
    return CircleAvatar(
      radius: 100,
      backgroundImage: NetworkImage(user!.image),
    );
  }
}
