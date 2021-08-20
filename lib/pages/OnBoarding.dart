import 'package:flutter/material.dart';
import 'AnaSayfa/AnaSayfa.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        SizedBox(
          height: boy * 0.2,
        ),
        //resim
        Image.asset("assets/images/besinler.png"),
        SizedBox(
          height: boy * 0.05,
        ),
        //bilgilendirici ön yazı
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, style: BorderStyle.solid),
          ),
          padding: EdgeInsets.only(left: en * 0.065, top: boy * 0.03),
          height: boy * 0.15,
          width: en * 0.85,
          child: Text(
            "Besinlerdeki vitaminleri ve vitaminlerin de\n"
            "ne işe yaradığını uzun uzun\naramana artık gerek kalmayacak !",
            style: TextStyle(
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: boy * 0.1,
        ),
        //baslayalim butonu
        Container(
          child: FlatButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AnaSayfa())),
              child: Text(
                "HADİ BAŞLAYALIM",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          height: boy * 0.08,
          width: en * 0.7,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 5), blurRadius: 9, color: Colors.green)
              ],
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.mirror,
                  colors: [Colors.green, Colors.green[200], Colors.green])),
        )
      ],
    );
  }
}
