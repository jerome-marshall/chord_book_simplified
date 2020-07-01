import 'package:flutter/foundation.dart';

class Song with ChangeNotifier {
  String _book = "Songs of Zion";
  String _name = "He is my Everything";
  int _number = 123;
  String _scale = "D";
  String _mode = "maj";
  String _rhythm = "4/4";
  String _misc = "A - A7\nAsus4\nF#maj - Build up";
  int _transpose = 0;

  void updateSong(Song song) {
    _book = song.book;
    _number = song.number;
    _name = song.name;
    _scale = song.scale;
    _mode = song.mode;
    _rhythm = song.rhythm;
    _misc = song.misc;
    _transpose = song.transpose;
    notifyListeners();
  }

  void updateSongNo(Map song) {
    _number = song['number'];
    _name = song['name'];
    _scale = song['scale'];
    _mode = song['mode'];
    _rhythm = song['rhythm'];
    _misc = song['misc'];
    _transpose = 0;
    notifyListeners();
  }

  updateSongDum() {
    _book = "Zion Songs";
    _number = 321;
    _name = "Light of the world";
    _scale = "G";
    _mode = "maj";
    _rhythm = "3/4";
    _misc = "song.misc";
    _transpose = 0;
    notifyListeners();
  }

//  Song.fromMap(Map<String, dynamic> data) {
//    _number = data["number"].toString();
//    _name = data["name"];
//    _scale = data["scale"];
//    _mode = data["mode"];
//    _rhythm = data["rhythm"];
//    _misc = data["misc"];
//    _transpose = 0;
//  }

  int get transpose => _transpose;

  set transpose(int value) {
    _transpose = value;
  }

  String get misc => _misc;

  set misc(String value) {
    _misc = value;
  }

  String get rhythm => _rhythm;

  set rhythm(String value) {
    _rhythm = value;
  }

  String get mode => _mode;

  set mode(String value) {
    _mode = value;
  }

  String get scale => _scale;

  set scale(String value) {
    _scale = value;
  }

  int get number => _number;

  set number(int value) {
    _number = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get book => _book;

  set book(String value) {
    _book = value;
  }
}
