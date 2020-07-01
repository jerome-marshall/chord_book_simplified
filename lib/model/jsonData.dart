import 'dart:convert';

import 'package:flutter/services.dart';

class JsonData {
  Map _songBook;

  Future<String> _loadJson(String bookName) async {
    String jsonData = '';
    switch (bookName) {
      case 'Songs of Zion':
        {
          jsonData = 'json/soz.json';
        }
        break;
      case 'Thirumarai Thirupadalgal':
        {
          jsonData = 'json/tt.json';
        }
        break;
    }
    return await rootBundle.loadString(jsonData);
  }

  Future loadSongBook(String sBook) async {
    _songBook = jsonDecode(await _loadJson(sBook));
  }

  Future<Map> getInitSongBook() async {
    await loadSongBook('Songs of Zion');
    return _songBook;
  }

  Future<Map> getSongBook(String bookName) async {
    await loadSongBook(bookName);
    return _songBook;
  }

  Map get songBook => _songBook;

  set songBook(Map value) {
    _songBook = value;
  }
}
