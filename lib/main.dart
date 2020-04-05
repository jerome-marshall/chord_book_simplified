import 'package:chordbooksimplified/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:chordbooksimplified/pages/loading.dart';
import 'package:tonic/tonic.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
      },
    ));
