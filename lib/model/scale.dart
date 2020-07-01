import 'dart:core';

import 'package:flutter/foundation.dart';

class Scale with ChangeNotifier {
  String _i = 'G',
      _ii = 'Am',
      _iii = 'Bm',
      _iv = 'C',
      _v = 'D',
      _vi = 'Em',
      _vii = 'F$sharp$dim',
      _mode = 'maj';
  static String dim = String.fromCharCode(119212);
  static String sharp = String.fromCharCode(9839);
  static String flat = String.fromCharCode(9837);

  void setScale(String scale, String mode) {
    if (mode == 'maj') {
      List scaleL = _majorScale[scale];
      _i = scaleL[0];
      _ii = scaleL[1];
      _iii = scaleL[2];
      _iv = scaleL[3];
      _v = scaleL[4];
      _vi = scaleL[5];
      _vii = scaleL[6];
      _mode = mode;
    } else if (mode == 'm') {
      List scaleL = _minorScale[scale];
      _i = scaleL[0];
      _ii = scaleL[1];
      _iii = scaleL[2];
      _iv = scaleL[3];
      _v = scaleL[4];
      _vi = scaleL[5];
      _vii = scaleL[6];
      _mode = mode;
    }
    notifyListeners();
  }

  Map _minorScale = {
    'C': ['Cm', 'D$dim', 'E$flat', 'Fm', 'Gm', 'A$flat', 'B$flat', 'm'],
    'D': ['Dm', 'E$dim', 'F', 'Gm', 'Am', 'B$flat', 'C', 'm'],
    'E': ['Em', 'F$sharp$dim', 'G', 'Am', 'Bm', 'C', 'D', 'm'],
    'F': ['Fm', 'G$dim', 'A$flat', 'B$flat' 'm', 'Cm', 'D$flat', 'E$flat', 'm'],
    'G': ['Gm', 'A$dim', 'B$flat', 'Cm', 'Dm', 'E$flat', 'F', 'm'],
    'A': ['Am', 'B$dim', 'C', 'Dm', 'Em', 'F', 'G', 'm'],
    'B': ['Bm', 'C$sharp$dim', 'D', 'Em', 'F$sharp' 'm', 'G', 'A', 'm'],
  };

  Map _majorScale = {
    'C': ['C', 'Dm', 'Em', 'F', 'G', 'Am', 'B$dim', 'maj'],
    'D': ['D', 'Em', 'F$sharp' 'm', 'G', 'A', 'Bm', 'C$sharp$dim', 'maj'],
    'E': [
      'E',
      'F$sharp' 'm',
      'G$sharp' 'm',
      'A',
      'B',
      'C$sharp' 'm',
      'D$sharp$dim',
      'maj'
    ],
    'F': ['F', 'Gm', 'Am', 'B$flat', 'C', 'Dm', 'E$dim', 'maj'],
    'G': ['G', 'Am', 'Bm', 'C', 'D', 'Em', 'F$sharp$dim', 'm'],
    'A': [
      'A',
      'Bm',
      'C$sharp' 'm',
      'D',
      'E',
      'F$sharp' 'm',
      'G$sharp$dim',
      'maj'
    ],
    'B': [
      'B',
      'C$sharp' 'm',
      'D$sharp' 'm',
      'E',
      'F$sharp',
      'G$sharp' 'm',
      'A$sharp$dim',
      'maj'
    ],
  };

  get mode => _mode;

  set mode(value) {
    _mode = value;
  }

  get vii => _vii;

  set vii(value) {
    _vii = value;
  }

  get vi => _vi;

  set vi(value) {
    _vi = value;
  }

  get v => _v;

  set v(value) {
    _v = value;
  }

  get iv => _iv;

  set iv(value) {
    _iv = value;
  }

  get iii => _iii;

  set iii(value) {
    _iii = value;
  }

  get ii => _ii;

  set ii(value) {
    _ii = value;
  }

  String get i => _i;

  set i(String value) {
    _i = value;
  }
}
