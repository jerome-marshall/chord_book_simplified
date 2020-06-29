import 'package:chordbooksimplified/model/data.dart';
import 'package:chordbooksimplified/model/scale.dart';
import 'package:chordbooksimplified/model/song.dart';
import 'package:chordbooksimplified/size_config.dart';
import 'package:chordbooksimplified/widgets/transpose_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class _HomeState extends State {
//  Data data;
//  Map bundle = {};

  final textController = TextEditingController();

  var neumorphicStyleProject = NeumorphicStyle(
    color: Colors.grey[200],
    depth: 4,
    intensity: 0.8,
  );
  var neumorphicStyleDepth = NeumorphicStyle(
    color: Colors.grey[200],
    depth: -4,
    intensity: 0.8,
  );

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.safeBlockHorizontal;
    double height = SizeConfig.safeBlockVertical;

//    bundle = bundle.isNotEmpty ? bundle : ModalRoute.of(context).settings.arguments;
//    data = bundle['data'];

    int songNo = textController.text == '' ? 1 : int.parse(textController.text);
//    Song song = data.getSong(songNo.toString());
//    Scale scale = data.getScale(song.scale, song.mode);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Container(
                    height: height * 10,
                    child: NeumorphicButton(
                      margin: EdgeInsets.fromLTRB(
                          height * 2, height * 2, height * 2, 0),
                      padding: EdgeInsets.all(height * 2),
                      boxShape: NeumorphicBoxShape.roundRect(
                          borderRadius: BorderRadius.circular(12)),
                      style: neumorphicStyleProject,
                      onClick: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/choose_book');
                        setState(() {
                          textController.text = '1';
//                              bundle = result;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/song_book.png',
                          ),
                          SizedBox(
                            width: width * 4,
                          ),
                          Flexible(
                            child: Text(
//                                  data.songBookName,
                              "Songs of Zion",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: height * 3.5,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height),
            Container(
              height: height * 12.5,
              padding:
                  EdgeInsets.fromLTRB(height * 2, height * 2, height * 2, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(
                          borderRadius: BorderRadius.circular(12)),
                      style: neumorphicStyleProject,
                      child: TextField(
                        controller: textController,
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(height * 2),
                          hintText: '......',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            fontSize: height * 6,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 4),
                  Expanded(
                    flex: 8,
                    child: Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(height),
                      style: neumorphicStyleProject,
                      child: Container(
                        child: Center(
                          child: Text(
//                                song.name,
                            "God will make a way",
                            style: TextStyle(
                                fontSize: height * 2.85,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Catamaran',
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    height * 2, height * 2, height * 2, height),
                child: Neumorphic(
                  boxShape: NeumorphicBoxShape.roundRect(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(height * 2),
                  style: neumorphicStyleDepth,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Scale',
                                  style: TextStyle(
                                      fontSize: height * 2.1,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.5),
                                ),
                                Text(
//                                      song.scale + song.mode,
                                  "G maj",
                                  style: TextStyle(
                                      fontSize: height * 6,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.5),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            child: NeumorphicButton(
                                margin: EdgeInsets.fromLTRB(
                                    height * 2, height * 2, height * 2, 0),
                                padding: EdgeInsets.all(height * 2),
                                boxShape: NeumorphicBoxShape.roundRect(
                                    borderRadius: BorderRadius.circular(100)),
                                style: neumorphicStyleProject,
                                onClick: () async {
                                  dynamic result = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        TransposeDialog(
//                                        song: song,
                                            ),
                                  );
//                                    setState(() {
//                                      song = result;
//                                    });
                                },
                                child: Text('Trans')),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Rhythm',
                                  style: TextStyle(
                                      fontSize: height * 2.1,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.5),
                                ),
                                Text(
//                                      song.rhythm,
                                  "4/4",
                                  style: TextStyle(
                                      fontSize: height * 6,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.5),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Neumorphic(
                              margin: EdgeInsets.fromLTRB(
                                  height * 2, height * 2, height * 2, 0),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(height * 1.75),
                              style: neumorphicStyleProject,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'i',
                                    style: TextStyle(
                                        fontSize: height * 1.75,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  ),
                                  Text(
//                                        scale.i,
                                    "G",
                                    style: TextStyle(
                                        fontSize: height * 4,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Neumorphic(
                              margin: EdgeInsets.fromLTRB(
                                  height * 2, height * 2, height * 2, 0),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(height * 1.75),
                              style: neumorphicStyleProject,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'ii',
                                    style: TextStyle(
                                        fontSize: height * 1.75,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  ),
                                  Text(
//                                        scale.ii,
                                    "Am",
                                    style: TextStyle(
                                        fontSize: height * 4,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Neumorphic(
                              margin: EdgeInsets.fromLTRB(
                                  height * 2, height * 2, height * 2, 0),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(height * 1.75),
                              style: neumorphicStyleProject,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'iii',
                                    style: TextStyle(
                                        fontSize: height * 1.75,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  ),
                                  Text(
//                                        scale.iii,
                                    "Bm",
                                    style: TextStyle(
                                        fontSize: height * 4,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Neumorphic(
                              margin: EdgeInsets.fromLTRB(
                                  height * 2, height * 2, height * 2, 0),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(height * 1.75),
                              style: neumorphicStyleProject,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'iv',
                                    style: TextStyle(
                                        fontSize: height * 1.75,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  ),
                                  Text(
//                                        scale.iv,
                                    "C",
                                    style: TextStyle(
                                        fontSize: height * 4,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Neumorphic(
                              margin: EdgeInsets.fromLTRB(
                                  height * 2, height * 2, height * 2, 0),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(height * 1.75),
                              style: neumorphicStyleProject,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'v',
                                    style: TextStyle(
                                        fontSize: height * 1.75,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  ),
                                  Text(
//                                        scale.v,
                                    "D",
                                    style: TextStyle(
                                        fontSize: height * 4,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Neumorphic(
                              margin: EdgeInsets.fromLTRB(
                                  height * 2, height * 2, height * 2, 0),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(height * 1.75),
                              style: neumorphicStyleProject,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'vi',
                                    style: TextStyle(
                                        fontSize: height * 1.75,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  ),
                                  Text(
//                                        scale.vi,
                                    "Em",
                                    style: TextStyle(
                                        fontSize: height * 4,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Neumorphic(
                            margin: EdgeInsets.fromLTRB(
                                height * 2, height * 2, height * 2, 0),
                            boxShape: NeumorphicBoxShape.roundRect(
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.all(height * 1.75),
                            style: neumorphicStyleProject,
                            child: Container(
                              width: 77,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'vii',
                                    style: TextStyle(
                                        fontSize: height * 1.75,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  ),
                                  Text(
//                                        scale.vii,
                                    "Bd",
                                    style: TextStyle(
                                        fontSize: height * 4,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 1.5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: width * 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Neumorphic(
                                margin: EdgeInsets.fromLTRB(
                                    height * 2, height * 2, height * 2, 0),
                                boxShape: NeumorphicBoxShape.roundRect(
                                    borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.all(height * 1.75),
                                style: neumorphicStyleProject,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Misc. Chords',
                                      style: TextStyle(
                                          fontSize: height * 2,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1.5),
                                    ),
                                    Text(
                                      '''C -> C7\nD -> D7\nShows the chords out of the scale''',
                                      style: TextStyle(
                                          fontSize: height * 2.5,
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
