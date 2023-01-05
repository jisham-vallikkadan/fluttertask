import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertask/service/providerclass.dart';
import 'package:provider/provider.dart';

import '../model/dricerlistmodel.dart';
import '../widgets/button.dart';
import 'adddriver.dart';
import 'package:http/http.dart' as http;

class Driverlist extends StatelessWidget {
  Driverlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Pdata = Provider.of<FluttertaskProvider>(context, listen: false);
    var Pw=context.watch<FluttertaskProvider>().getdriverlist();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(child: Text('Driver List')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<DriverList>>(
                future: Pdata.getdriverlist(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data!.length} Drivers Fount',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 15),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<List<DriverList>>(
                future: Pdata.getdriverlist(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          // var driverdata = driverlist[index];
                          var driverdata = snapshot.data![index];
                          return Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                        color: Color(0xfff3f3f4),
                                      ),
                                      width: 70,
                                      height: 70,
                                      child: Center(
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/driver.png')),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${driverdata.name}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Licn no:${driverdata.license_no}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Button(
                                        click: () {
                                          Pdata.deletdriver(driverdata.id!);
                                          // print(driverdata.id);
                                          Pdata.getdriverlist();


                                        },
                                        buttontext: 'Delete',
                                        buttonheight: 40,
                                        buttondecoration: BoxDecoration(
                                            color: Color(0xffed173a),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        buttontextfontsize: 14,
                                        buttonmarginright: 10,
                                        buttonmarginleft: 20,
                                        buttontextcolour: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        },
                        itemCount: snapshot.data!.length);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              click: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddDriver(),
                    ));
              },
              buttontext: 'Add Driver',
              buttonheight: 50,
              buttondecoration: BoxDecoration(
                  color: Color(0xffed173a),
                  borderRadius: BorderRadius.circular(10)),
              buttontextfontsize: 17,
              buttonmarginright: 20,
              buttonmarginleft: 20,
              buttontextcolour: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
