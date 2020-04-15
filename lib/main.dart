import 'package:chordbooksimplified/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:chordbooksimplified/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
      },
    ));
