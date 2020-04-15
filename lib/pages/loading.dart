import 'dart:async' show Future;
import 'dart:convert';

import 'package:chordbooksimplified/model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
    String jsonSoz = await Future.delayed(Duration(seconds: 3), () {
      return rootBundle.loadString('json/soz.json');
    });

    Map sozSongBook = jsonDecode(jsonSoz);
    print(sozSongBook["1"]);
    Data data = new Data();
    data.setSozSongBook(sozSongBook);
    Navigator.pushReplacementNamed(context, '/home', arguments: {'data': data});
  }
}
