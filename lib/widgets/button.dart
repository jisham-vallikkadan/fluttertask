import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  void Function() click;
  String buttontext;
  Color? buttontextcolour;
  double buttontextfontsize;
  Decoration buttondecoration;
  double buttonmarginleft;
  double buttonmarginright;
  double buttonheight;

  Button({
    Key? key,
    required this.click,
    required this.buttontext,
    required this.buttonheight,
    required this.buttondecoration,
    required this.buttontextfontsize,
   required this.buttonmarginright,
    required this.buttonmarginleft,
    this.buttontextcolour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: buttonheight,
      margin: EdgeInsets.only(left: buttonmarginleft, right: buttonmarginright),
      decoration: buttondecoration,
      child: TextButton(
        onPressed: click,
        child: Text(
          buttontext,
          style: TextStyle(color: buttontextcolour, fontSize: buttontextfontsize),
        ),
      ),
    );
  }
}
