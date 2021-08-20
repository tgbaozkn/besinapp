import 'ui/AcilirSayfa.dart';
import 'ui/MeyveSebzeButon.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  double uzaklik = 1;
  @override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    return Material(
      child: Stack(
        children: [
          Column(
            children: [
              AppBar(
                title: Image.asset("assets/images/baslik.png"),
                backgroundColor: Color.fromRGBO(34, 177, 76, 1),
                leading: IconButton(
                  icon: Icon(Icons.dehaze),
                  onPressed: () {
                    setState(() {
                      uzaklik = 0.05;
                    });
                  },
                ),
              ),
              SizedBox(
                height: boy * 0.06,
              ),
              MeyveSebzeVitamin(),
            ],
          ),
          if (uzaklik < 1)
            AnimatedContainer(
              duration: Duration(milliseconds: 400), //
              height: boy * 1, //
              color: Colors.black.withOpacity(0.5),
            )
          else
            Container(),
          AnimatedContainer(
            //
            duration: Duration(milliseconds: 400), //
            margin: EdgeInsets.only(right: en * uzaklik), //
            child: AcilirSayfa(
              sayfakapan: () {
                setState(() {
                  uzaklik = 1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
