import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../AnaSayfa/ui/AcilirSayfa.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Sebzeler extends StatefulWidget {
  @override
  _SebzelerState createState() => _SebzelerState();
}

class _SebzelerState extends State<Sebzeler> {
  double uzaklik = 1;
  List<String> fotolar = [
    "assets/images/brocoli.png",
    "assets/images/onion.png"
  ];
  List list = List();
  var isLoading = false;
  // _fetchData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   http.Client client = new http.Client();
  //   client
  //       .get("https://my-json-server.typicode.com/tgbaozkn/demo/pictures")
  //       .then((http.Response response) {
  //     list = json.decode(response.body) as List;
  //     setState(() {
  //       isLoading = false;
  //       print(response.body);
  //       print(response.statusCode);
  //     });
  //   });
  // }
  Future<http.Response> fetchData(http.Client client) async {
    return client
        .get("https://my-json-server.typicode.com/tgbaozkn/demo/pictures");
  }

  List<Photo> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response = await client
        .get('https://my-json-server.typicode.com/tgbaozkn/demo/pictures');

    return compute(parsePhotos, response.body);
  }

  @override
  Widget build(BuildContext context) {
    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;
    //_fetchData();
    return Material(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: Text("Sebzeler"),
                  backgroundColor: Color.fromRGBO(34, 177, 76, 1),
                  leading: IconButton(
                    icon: Icon(Icons.dehaze),
                    onPressed: () {
                      setState(() {
                        uzaklik = 0.2;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: boy * 0.45,
                ),
                FutureBuilder<List<Photo>>(
                  //
                  future: fetchPhotos(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? PhotosList(
                            photos: snapshot.data,
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }, //
                ),
              ],
            ),
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

class Photo {
  final int id;
  final String title;
  final String url;
  Photo({this.id, this.title, this.url});
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].url);
      },
    );
  }
}
