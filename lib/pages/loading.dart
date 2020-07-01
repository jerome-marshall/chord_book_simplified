import 'dart:async' show Future;
import 'dart:convert';

import 'package:chordbooksimplified/model/data.dart';
import 'package:chordbooksimplified/model/jsonData.dart';
import 'package:chordbooksimplified/model/song.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Container(
            child: SpinKitWave(
              color: Colors.grey[800],
              size: 50.0,
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Song song = new Song();
    Map songBook = await JsonData().getInitSongBook();
//    song.number = songBook['1']['number'];
//    song.name = songBook['1']['name'];
//    song.book = songBook['book'];
//    song.scale = songBook['1']['scale'];
//    song.mode = songBook['1']['mode'];
//    song.rhythm = songBook['1']['rhythm'];
//    song.misc = songBook['1']['misc'];
//    song.transpose = 0;

    Navigator.pushReplacementNamed(
        context, '/home', arguments: {'songBook': songBook});
  }
}
