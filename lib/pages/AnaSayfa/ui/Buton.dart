import 'package:flutter/material.dart';

class Buton extends StatefulWidget {
  String resim;
  Function tikla;
  Buton({this.resim, this.tikla});
  @override
  _ButonState createState() => _ButonState();
}

class _ButonState extends State<Buton> {
  @override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: widget.tikla,
      child: Container(
        child: Transform.scale(
          scale: 0.9,
          child: Image.asset(widget.resim),
        ),
        margin: EdgeInsets.only(
          left: 10,
        ),
        height: boy * 0.3,
        width: en * 0.45,
        decoration: BoxDecoration(
            gradient: RadialGradient(radius: 5, colors: [
              Colors.white,
              Colors.grey,
              Colors.white,
            ]),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 10, offset: Offset(0, 8))
            ]),
      ),
    );
  }
}
