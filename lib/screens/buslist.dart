import 'package:flutter/material.dart';
import 'package:fluttertask/screens/driverlist.dart';
import 'package:fluttertask/widgets/button.dart';

import '../model/buslistmodel.dart';
import '../widgets/columbuilder.dart';
import '../widgets/container.dart';

class Buslist extends StatelessWidget {
  Buslist({Key? key}) : super(key: key);
  List<BusList> buslistdata = <BusList>[
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
    BusList(
        Busimage: 'images/bus.png',
        Busname: 'KSRTC',
        Bustype: 'Swift Scania P-serice'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'moov',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'be',
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.2,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffed173a),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bus',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Text(
                            'Manage your Bus',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: double.infinity,
                              child: Image(
                                image: AssetImage('images/bus.png'),
                                width: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Driverlist(),));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Driver',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Text(
                            'Manage your Driver',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: double.infinity,
                              child: Image(
                                image: AssetImage('images/driver.png'),
                                width: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '${buslistdata.length} Buses Found',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            ColumBulider(
              itemCount: buslistdata.length,
              itemBuilder: (context, index) {
                var busdata = buslistdata[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Card(
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
                              child: Image(
                                image: AssetImage(busdata.Busimage),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    busdata.Busname,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    busdata.Bustype,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Button(
                                click: () {},
                                buttontext: 'Manage',
                                buttonheight: 40,
                                buttondecoration: BoxDecoration(
                                    color: Color(0xffed173a),
                                    borderRadius: BorderRadius.circular(5)),
                                buttontextfontsize: 14,
                                buttonmarginright: 10,
                                buttonmarginleft: 10,
                                buttontextcolour: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
