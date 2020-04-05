import 'package:chordbooksimplified/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.safeBlockHorizontal;
    double height = SizeConfig.safeBlockVertical;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Container(
                    height: height * 10,
                    width: width * 90,
                    child: Neumorphic(
                      margin: EdgeInsets.fromLTRB(
                          height * 2, height * 2, height * 2, 0),
                      padding: EdgeInsets.all(height * 2),
                      boxShape: NeumorphicBoxShape.roundRect(
                          borderRadius: BorderRadius.circular(12)),
                      style: neumorphicStyleProject,
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
                              'Songs of Zion',
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
                children: <Widget>[
                  Neumorphic(
                    boxShape: NeumorphicBoxShape.roundRect(
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(height * 2),
                    style: neumorphicStyleProject,
                    child: Text(
                      '001',
                      style: TextStyle(
                          fontSize: height * 6,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2),
                    ),
                  ),
                  SizedBox(width: width * 4),
                  Flexible(
                    child: Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(height * 1.9),
                      style: neumorphicStyleProject,
                      child: Container(
                        child: Text(
                          'Song Name can be of any length',
                          style: TextStyle(
                              fontSize: height * 2.85,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.5),
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
                                  'G maj',
                                  style: TextStyle(
                                      fontSize: height * 6,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 1.5),
                                )
                              ],
                            ),
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
                                  '4/4',
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
                                    'G',
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
                                    'Am',
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
                                    'Bm',
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
                                    'C',
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
                                    'D',
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
                                    'Em',
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
                                    'F#*',
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
