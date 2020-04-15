import 'dart:convert';

import 'package:chordbooksimplified/model/scale.dart';
import 'package:chordbooksimplified/model/song.dart';
import 'package:flutter/services.dart';

class Data {
  static String dim = String.fromCharCode(119212);
  static String sharp = String.fromCharCode(9839);
  static String flat = String.fromCharCode(9837);

  Map _sozSongBook;

  Map _minorScale = {
    'C': Scale(
        i: 'Cm',
        ii: 'D$dim',
        iii: 'E$flat',
        iv: 'Fm',
        v: 'Gm',
        vi: 'A$flat',
        vii: 'B$flat',
        mode: 'm'),
    'D': Scale(
        i: 'Dm',
        ii: 'E$dim',
        iii: 'F',
        iv: 'Gm',
        v: 'Am',
        vi: 'B$flat',
        vii: 'C',
        mode: 'm'),
    'E': Scale(
        i: 'Em',
        ii: 'F$sharp$dim',
        iii: 'G',
        iv: 'Am',
        v: 'Bm',
        vi: 'C',
        vii: 'D',
        mode: 'm'),
    'F': Scale(
        i: 'Fm',
        ii: 'G$dim',
        iii: 'A$flat',
        iv: 'B$flat' 'm',
        v: 'Cm',
        vi: 'D$flat',
        vii: 'E$flat',
        mode: 'm'),
    'G': Scale(
        i: 'Gm',
        ii: 'A$dim',
        iii: 'B$flat',
        iv: 'Cm',
        v: 'Dm',
        vi: 'E$flat',
        vii: 'F',
        mode: 'm'),
    'A': Scale(
        i: 'Am',
        ii: 'B$dim',
        iii: 'C',
        iv: 'Dm',
        v: 'Em',
        vi: 'F',
        vii: 'G',
        mode: 'm'),
    'B': Scale(
        i: 'Bm',
        ii: 'C$sharp$dim',
        iii: 'D',
        iv: 'Em',
        v: 'F$sharp' 'm',
        vi: 'G',
        vii: 'A',
        mode: 'm'),
  };

  Map _majorScale = {
    'C': Scale(
        i: 'C',
        ii: 'Dm',
        iii: 'Em',
        iv: 'F',
        v: 'G',
        vi: 'Am',
        vii: 'B$dim',
        mode: 'maj'),
    'D': Scale(
        i: 'D',
        ii: 'Em',
        iii: 'F$sharp' 'm',
        iv: 'G',
        v: 'A',
        vi: 'Bm',
        vii: 'C$sharp$dim',
        mode: 'maj'),
    'E': Scale(
        i: 'E',
        ii: 'F$sharp' 'm',
        iii: 'G$sharp' 'm',
        iv: 'A',
        v: 'B',
        vi: 'C$sharp' 'm',
        vii: 'D$sharp$dim',
        mode: 'm'),
    'F': Scale(
        i: 'F',
        ii: 'Gm',
        iii: 'Am',
        iv: 'B$flat',
        v: 'C',
        vi: 'Dm',
        vii: 'E$dim',
        mode: 'maj'),
    'G': Scale(
        i: 'G',
        ii: 'Am',
        iii: 'Bm',
        iv: 'C',
        v: 'D',
        vi: 'Em',
        vii: 'F$sharp$dim',
        mode: 'm'),
    'A': Scale(
        i: 'A',
        ii: 'Bm',
        iii: 'C$sharp' 'm',
        iv: 'D',
        v: 'E',
        vi: 'F$sharp' 'm',
        vii: 'G$sharp$dim',
        mode: 'maj'),
    'B': Scale(
        i: 'B',
        ii: 'C$sharp' 'm',
        iii: 'D$sharp' 'm',
        iv: 'E',
        v: 'F$sharp',
        vi: 'G$sharp' 'm',
        vii: 'A$sharp$dim',
        mode: 'maj'),
  };

  Data();

  void setSozSongBook(Map soz) {
    this._sozSongBook = soz;
  }

  Map getSozSongBook() {
    return this._sozSongBook;
  }

  Song getSong(String number) {
    return Song.fromMap(_sozSongBook[number]);
  }


  Scale getScale(String scale, String mode) {
    return mode == 'maj' ? _majorScale[scale] : _minorScale[scale];
  }

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

