import 'package:flutter/material.dart';

class DriverList {
  int? id;
  String? name;
  String? mobile;
  String? license_no;
  DriverList({
    this.id,
    this.name,
    this.license_no,
    this.mobile,
  });
  factory DriverList.fromjson(Map<String, dynamic> responce) {
    return DriverList(
      id: responce['id'],
      name: responce['name'],
      license_no: responce['license_no'],
      mobile: responce['mobile'],
    );
  }
}


// List<DriverList> driverlist = <DriverList>[
//   DriverList(
//       Driverimage: 'images/driver.png',
//       Drivername: 'Jisahm',
//       Driverlicno: 'PJ5151961616'),
//   DriverList(
//       Driverimage: 'images/driver2.png',
//       Drivername: 'Jisahm',
//       Driverlicno: 'fbalkfml6576'),
//   DriverList(
//       Driverimage: 'images/driver.png',
//       Drivername: 'Jisahm',
//       Driverlicno: 'fbalkfml6576'),
//   DriverList(
//       Driverimage: 'images/driver2.png',
//       Drivername: 'Jisahm',
//       Driverlicno: 'fbalkfml6576'),
//   DriverList(
//       Driverimage: 'images/driver.png',
//       Drivername: 'Jisahm',
//       Driverlicno: 'fbalkfml6576'),
//   DriverList(
//       Driverimage: 'images/driver2.png',
//       Drivername: 'Jisahm',
//       Driverlicno: 'fbalkfml6576'),
//   DriverList(
//       Driverimage: 'images/driver.png',
//       Drivername: 'Jisahm',
//       Driverlicno: 'fbalkfml6576'),
//   DriverList(
//       Driverimage: 'images/driver2.png',
//       Drivername: 'Jisahm',
//       Driverlicno: 'fbalkfml6576'),
//   DriverList(
//       Driverimage: 'images/driver2.png',
//       Drivername: 'Jisahm',
//       Driverlicno: 'fbalkfml6576'),
// ];
