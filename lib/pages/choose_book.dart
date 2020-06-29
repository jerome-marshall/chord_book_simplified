import 'dart:convert';

import 'package:chordbooksimplified/model/data.dart';
import 'package:chordbooksimplified/model/scale.dart';
import 'package:chordbooksimplified/model/song.dart';
import 'package:chordbooksimplified/model/song_book.dart';
import 'package:chordbooksimplified/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ChooseBook extends StatefulWidget {
  @override
  _ChooseBookState createState() => _ChooseBookState();
}

class _ChooseBookState extends State<ChooseBook> {
  String _json;

  List<SongBook> books = [
    SongBook(name: "Songs of Zion", icon: "assets/song_book.png"),
    SongBook(name: "Thirumarai Thirupadalgal", icon: "assets/song_book.png"),
  ];

  var neumorphicStyleProject = NeumorphicStyle(
    color: Colors.grey[200],
    depth: 4,
    intensity: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.safeBlockHorizontal;
    double height = SizeConfig.safeBlockVertical;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Container(
            height: height * 10,
            width: width * 90,
            child: NeumorphicButton(
              margin:
                  EdgeInsets.fromLTRB(height * 2, height * 2, height * 2, 0),
              boxShape: NeumorphicBoxShape.roundRect(
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(height * 1.75),
              style: neumorphicStyleProject,
              onClick: () async {
                Data data = new Data();

                switch (index) {
                  case 0:
                    {
                      _json = await rootBundle.loadString('json/soz.json');
                      data.songBookName = "Songs of Zion";
                    }
                    break;

                  case 1:
                    {
                      _json = await rootBundle.loadString('json/tt.json');
                      data.songBookName = "Thirumarai Thirupadalgal";
                    }
                    break;
                }
                Map songBook = jsonDecode(_json);
                print(songBook["1"]);
                data.setSozSongBook(songBook);
                Navigator.pop(context, {'data': data});
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/song_book.png',
                  ),
                  SizedBox(
                    width: width * 4,
                  ),
                  Flexible(
                    child: Text(
                      books[index].name,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: height * 3.5,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
