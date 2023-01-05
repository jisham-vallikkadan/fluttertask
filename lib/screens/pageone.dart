import 'package:flutter/material.dart';
import 'package:fluttertask/screens/loginpage.dart';

import '../widgets/button.dart';

class Pageone extends StatelessWidget {
  const Pageone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xfffb153b),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Align(
            //   alignment: Alignment.center,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'moov',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 50,
            //             fontWeight: FontWeight.w500),
            //       ),
            //       Text(
            //         'be',
            //         style: TextStyle(
            //             color: Colors.yellow,
            //             fontSize: 50,
            //             fontWeight: FontWeight.w500),
            //       )
            //     ],
            //   ),
            // ),
            Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('images/titileimg.png'),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Button(
                  click: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Loginpage(),
                        ));
                  },
                  buttontext: 'Get Started',
                  buttontextcolour: Colors.red,
                  buttontextfontsize: 18,
                  buttonheight: 50,
                  buttondecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  buttonmarginleft: 20,
                  buttonmarginright: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
