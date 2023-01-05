

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/dricerlistmodel.dart';
import '../service/providerclass.dart';
import '../widgets/button.dart';
import 'driverlist.dart';

class AddDriver extends StatelessWidget {
  AddDriver({Key? key}) : super(key: key);

  TextEditingController drivernamecontroler = TextEditingController();

  TextEditingController licnocontroelr = TextEditingController();
  TextEditingController numbercontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var Pdata = Provider.of<FluttertaskProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(child: Text('Add  Driver')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: drivernamecontroler,
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
                      hintText: 'Enter Name',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600])),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: licnocontroelr,
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
                      hintText: 'Enter License Number',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600])),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: numbercontroler,
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
                      hintText: 'Enter mobileNumber',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600])),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Button(
              click: () {
                if(drivernamecontroler.text==''||numbercontroler.text==''||licnocontroelr.text==""){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Driverlist(),));
                }else{
                  Pdata.adddriver({
                    'name': drivernamecontroler.text,
                    'license_no': licnocontroelr.text,
                    'mobile': numbercontroler.text,
                  });
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Driverlist(),));
                }
              },
              buttontext: 'Save',
              buttonheight: 50,
              buttondecoration: BoxDecoration(
                  color: Color(0xffed173a),
                  borderRadius: BorderRadius.circular(10)),
              buttontextfontsize: 17,
              buttonmarginright: 20,
              buttonmarginleft: 20,
              buttontextcolour: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
