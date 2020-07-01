import 'dart:convert';

import 'package:chordbooksimplified/model/scale.dart';
import 'package:chordbooksimplified/model/song.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum ViewState { Idle, Busy }

class Data extends ChangeNotifier {
  static String dim = String.fromCharCode(119212);
  static String sharp = String.fromCharCode(9839);
  static String flat = String.fromCharCode(9837);

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  String _songBookName = "Songs of Zion";

  Map _sozSongBook;

  Data();

  String get songBookName => _songBookName;

  set songBookName(String value) {
    _songBookName = value;
  }

  void setSozSongBook(Map soz) {
    this._sozSongBook = soz;
  }

  Map getSozSongBook() {
    return this._sozSongBook;
  }

//  Song getSong(String number) {
//    return Song.fromMap(_sozSongBook[number]);
//  }

//
//  Scale getScale(String scale, String mode) {
//    return mode == 'maj' ? _majorScale[scale] : _minorScale[scale];
//  }

  Future<String> _loadSozJson() async {
    return await rootBundle.loadString('json/soz.json');
  }

  Future loadSoz() async {
    String jsonCrossword = await _loadSozJson();
    Map decoded = jsonDecode(jsonCrossword);
    _sozSongBook = decoded;
  }

  Future<Map> getSongBook(int n) async {
    await loadSoz();
    return this._sozSongBook;
  }


}

