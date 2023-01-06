import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fluttertask/screens/buslist.dart';
import 'package:fluttertask/service/providerclass.dart';
import 'package:fluttertask/widgets/button.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginpage extends StatelessWidget {
  Loginpage({Key? key}) : super(key: key);

  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController passwordcontroler = TextEditingController();
  bool? status;
  String? token;

  @override
  Widget build(BuildContext context) {
    var _Povider = Provider.of<FluttertaskProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  // decoration: BoxDecoration(color: Colors.red,
                  //     image: DecorationImage(
                  //         image: AssetImage(
                  //             "images/img.png"
                  //         ),
                  //         fit: BoxFit.cover
                  //     )
                  // ),
                  color: Colors.red,
                  width: double.infinity,
                  height: 250,

                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Manage your Bus and Drivers',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextField(
                    controller: usernamecontroller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: Color(0xffeaeaea),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: 'Enter Username',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600])),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextField(
                    controller: passwordcontroler,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: Color(0xffeaeaea),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600])),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Button(
                click: () async {
                  SharedPreferences prefer =
                      await SharedPreferences.getInstance();
                  status = prefer.getBool('status');
                  token = prefer.getString('token');
                  print(token);
                  _Povider.login(
                    {
                      "username": usernamecontroller.text,
                      "password": passwordcontroler.text
                    },
                  );

                  if (status == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Buslist(),
                        ));
                  } else {
                    Fluttertoast.showToast(msg: 'Enter values');
                  }
                },
                buttontext: 'Login',
                buttonheight: 50,
                buttondecoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                buttontextfontsize: 17,
                buttonmarginright: 20,
                buttonmarginleft: 20,
                buttontextcolour: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
