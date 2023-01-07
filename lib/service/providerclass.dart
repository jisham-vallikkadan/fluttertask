import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertask/model/dricerlistmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/buslistmodel.dart';
import '../screens/buslist.dart';

class FluttertaskProvider with ChangeNotifier {
  String? key;
  String? tokn;
  bool? staus;

  String baseurl = 'http://flutter.noviindus.co.in/api/';

  Future login(Map<String, dynamic> logindata,BuildContext) async {
    var url = baseurl + "LoginApi";
    var responce = await http.post(Uri.parse(url), body: logindata);
    var body = jsonDecode(responce.body);
    // print(body);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool status = body['status'];
    String? token = body['access'];
    String? apikey = body['url_id'];

    // print(status);
    // print(token);
    // print(apikey);
    preferences.setBool('status', status);
    preferences.setString('token', token.toString());
    preferences.setString('apikey', apikey.toString());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    tokn = sharedPreferences.getString('token');
    key = sharedPreferences.getString('apikey');
    staus = sharedPreferences.getBool('status');
    if(staus==true){
      Navigator.pushReplacement(BuildContext, MaterialPageRoute(builder: (context) => Buslist(),));
    }else{
      print('enter valuerd');
    }

    print(staus);
   // return staus.toString();
  }

  Future<List<DriverList>> getdriverlist() async {
    var url = baseurl + 'DriverApi/' + key.toString() + '/';
    // print(url);
    // print(tokn);
    // print(key);
    var resposnce = await http
        .get(Uri.parse(url), headers: {"Authorization": 'Bearer ${tokn}'});
    if (resposnce.statusCode == 200) {
      var body = jsonDecode(resposnce.body);

      List<DriverList> listdata = List<DriverList>.from(
          body['driver_list'].map((e) => DriverList.fromjson(e))).toList();
      notifyListeners();
      return listdata;
    } else {
      List<DriverList> listdata = [];
      return listdata;
    }
  }

  Future adddriver(Map<String, dynamic> driverdata) async {
    var url = baseurl + 'DriverApi/' + key.toString() + '/';
    var responce = await http.post(Uri.parse(url),
        body: driverdata, headers: {"Authorization": 'Bearer ${tokn}'});
    var body = jsonDecode(responce.body);
    notifyListeners();
    print(driverdata);
    print(body);
  }

  Future deletdriver(int id) async {
    var url = baseurl + 'DriverApi/' + key.toString() + '/';
    var responce = await http.delete(Uri.parse(url),
        headers: {"Authorization": 'Bearer ${tokn}'},
        body: {'driver_id': id.toString()});

    var body = jsonDecode(responce.body);
    print(body);
    notifyListeners();
    if (responce.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Future<String> checktokenvalid(String token) async {
  //   var url = baseurl + 'DriverApi/' + key.toString() + '/';
  //   var responce = await http.get(
  //     Uri.parse(url),
  //     headers: {"Authorization": 'Bearer ${tokn}'},
  //   );
  //   if (responce.statusCode == 200) {
  //     print('retuern true');
  //     return 'true';
  //   } else {
  //     print('retuern false');
  //     return 'false';
  //   }
  // }

}
