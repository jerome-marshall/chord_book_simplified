class Song {
  String book;
  String name;
  String number;
  String scale;
  String mode;
  String rhythm;
  String misc;

  Song(
      {this.book, this.number, this.name, this.scale, this.rhythm, this.misc, this.mode});

  Song.fromMap(Map<String, dynamic> data){
    number = data["number"].toString();
    name = data["name"];
    scale = data["scale"];
    mode = data["mode"];
    rhythm = data["rhythm"];
    misc = data["misc"];
  }
}
