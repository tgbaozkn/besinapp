import 'Buton.dart';
import 'package:flutter/material.dart';

class AcilirSayfa extends StatefulWidget {
  Function sayfakapan;
  AcilirSayfa({this.sayfakapan});
  @override
  _AcilirSayfaState createState() => _AcilirSayfaState();
}

class _AcilirSayfaState extends State<AcilirSayfa> {
  List<String> fotolar = [
    "assets/images/vegetables.png",
    "assets/images/fruits.png",
    "assets/images/vitamins.png"
  ];
  @override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: boy * 1,
        width: en * 0.8,

        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 9, //
              offset: Offset(1, 7),
              color: Colors.grey)
        ]),
        //meyve sebze vitamin gosterildigi yer
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: boy * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: en * 0.28, //
                  ),
                  Text(
                    "Bölümler ",
                    style: //
                        TextStyle(
                            fontWeight: FontWeight.bold, //
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    width: en * 0.1, //
                  ),
                  IconButton(
                      icon: Icon(Icons.close), //
                      onPressed: () {
                        widget.sayfakapan();
                      }),
                ],
              ),
              Divider(
                color: Colors.black,
                height: 1,
              ),
              SizedBox(
                height: boy * 0.05,
              ),
              Text(
                "Sebzeler",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Transform.scale(
                  scale: 0.6, //
                  child: Buton(resim: fotolar[0])),
              Text("Meyveler", style: TextStyle(fontWeight: FontWeight.bold)),
              Transform.scale(
                scale: 0.6,
                child: Buton(
                  resim: fotolar[1],
                ),
              ),
              Text(
                "Vitaminler",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Transform.scale(
                scale: 0.6,
                child: Buton(
                  resim: fotolar[2],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
