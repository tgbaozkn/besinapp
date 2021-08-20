import 'package:flutter/material.dart';
import 'Buton.dart';
import '../../Sebzeler/Sebzeler.dart';

class MeyveSebzeVitamin extends StatefulWidget {
  @override
  _MeyveSebzeVitaminState createState() => _MeyveSebzeVitaminState();
}

class _MeyveSebzeVitaminState extends State<MeyveSebzeVitamin> {
  List<String> fotolar = [
    "assets/images/vegetables.png",
    "assets/images/fruits.png",
  ];
  @override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sebzeler",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: en * 0.35,
            ),
            Text("Meyveler", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(
          height: boy * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Buton(
              resim: fotolar[0],
              tikla: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sebzeler()),
              ),
            ),
            Buton(
              resim: fotolar[1],
            ),
          ],
        ),
        SizedBox(
          height: boy * 0.05,
        ),
        Text(
          "Vitaminler",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: boy * 0.02,
        ),
        Buton(
          resim: "assets/images/vitamins.png",
        )
      ],
    );
  }
}
