import 'package:chordbooksimplified/size_config.dart';
import 'package:chordbooksimplified/widgets/transpose_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textController = TextEditingController();

  var neumorphicStyleProject = NeumorphicStyle(
    color: Hexcolor('#E1E5EC'),
    depth: 4,
    intensity: 0.8,
  );
  var neumorphicStyleProjectBlue = NeumorphicStyle(
    color: Hexcolor('#B8C6FF'),
    depth: 4,
    intensity: 0.8,
  );
  var neumorphicStyleDepth = NeumorphicStyle(
    color: Hexcolor('#E1E5EC'),
    depth: -4,
    intensity: 0.8,
  );

  var scaleRhythmGroup = AutoSizeGroup();
  var scaleDegGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.safeBlockHorizontal;
    double height = SizeConfig.safeBlockVertical;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Hexcolor('#E1E5EC'),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            // Song Book
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
                      style: neumorphicStyleProjectBlue,
                      onClick: () {},
                      child: AutoSizeText(
                        "Songs of Zion",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: height * 4,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 2),

            // Song number and name
            Container(
              height: height * 12.5,
              padding:
                  EdgeInsets.fromLTRB(height * 2, height * 2, height * 2, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Song Number
                  Expanded(
                    flex: 3,
                    child: Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(
                          borderRadius: BorderRadius.circular(12)),
                      style: neumorphicStyleProjectBlue,
                      child: TextField(
                        controller: textController,
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(height * 2),
                          hintText: '......',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            fontSize: height * 5,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2),
                      ),
                    ),
                  ),

                  SizedBox(width: width * 6),

                  // Song Name
                  Expanded(
                    flex: 8,
                    child: Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(height),
                      style: neumorphicStyleProject,
                      child: Container(
                        child: Center(
                          child: AutoSizeText(
//                                song.name,
                            "God will make a way",
                            style: TextStyle(
                                fontSize: height * 3.5,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Catamaran',
                                letterSpacing: 1.5),
                            maxLines: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 3),

            // Scale Rhythm Degree Misc
            Expanded(
              child: Container(
                child: Neumorphic(
                  boxShape: NeumorphicBoxShape.roundRect(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.fromLTRB(
                      height * 3.5, height / 2, height * 3.5, 0),
                  margin: EdgeInsets.all(height),
                  style: neumorphicStyleDepth,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          0, (height * 2) + height / 2, 0, height * 3),
                      child: Column(
                        children: <Widget>[
                          // Scale and Rhythm
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // Scale
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Scale',
                                      style: TextStyle(
                                          fontSize: height * 1.8,
                                          color: Hexcolor('#082AF2'),
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1.5),
                                    ),
                                    SizedBox(
                                      height: height,
                                    ),
                                    AutoSizeText(
                                      "G# maj",
                                      style: TextStyle(
                                          fontSize: height * 6,
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1.5),
                                      maxLines: 1,
                                      group: scaleRhythmGroup,
                                    )
                                  ],
                                ),
                              ),

                              // Transpose Button
                              NeumorphicButton(
                                  margin: EdgeInsets.fromLTRB(height * 3.5,
                                      height * 2, height * 3.5, height * 2),
                                  padding: EdgeInsets.all(height * 2),
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      borderRadius: BorderRadius.circular(100)),
                                  style: neumorphicStyleProjectBlue,
                                  onClick: () async {
                                    dynamic result = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          TransposeDialog(),
                                    );
                                  },
                                  child: Text('Trans')),

                              // Rhythm
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Rhythm',
                                      style: TextStyle(
                                          fontSize: height * 1.8,
                                          color: Hexcolor('#082AF2'),
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1.5),
                                    ),
                                    SizedBox(
                                      height: height,
                                    ),
                                    AutoSizeText(
                                      "4/4",
                                      style: TextStyle(
                                          fontSize: height * 6,
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 1.5),
                                      maxLines: 1,
                                      group: scaleRhythmGroup,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: height,
                          ),

                          // Scale Degree
                          Container(
                            margin: EdgeInsets.fromLTRB(0, height, 0, 0),
                            height: height * 41,
                            child: GridView.count(
                              childAspectRatio: width / 3.2,
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 2,
                              primary: false,
                              children: <Widget>[
                                Neumorphic(
                                  margin: EdgeInsets.fromLTRB(
                                      height * 2, height * 2, height * 2, 0),
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.all(height * 1.2),
                                  style: neumorphicStyleProject,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'i',
                                        style: TextStyle(
                                            fontSize: height * 1.75,
                                            color: Hexcolor('#082AF2'),
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                      ),
                                      SizedBox(
                                        height: width,
                                      ),
                                      AutoSizeText(
                                        "G",
                                        style: TextStyle(
                                            fontSize: height * 3.5,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                        group: scaleDegGroup,
                                        maxLines: 1,
                                      )
                                    ],
                                  ),
                                ),
                                // Deg ii
                                Neumorphic(
                                  margin: EdgeInsets.fromLTRB(
                                      height * 2, height * 2, height * 2, 0),
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.all(height * 1.2),
                                  style: neumorphicStyleProject,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'ii',
                                        style: TextStyle(
                                            fontSize: height * 1.75,
                                            color: Hexcolor('#082AF2'),
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                      ),
                                      SizedBox(
                                        height: width,
                                      ),
                                      AutoSizeText(
                                        "Am",
                                        style: TextStyle(
                                            fontSize: height * 3.5,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                        group: scaleDegGroup,
                                        maxLines: 1,
                                      )
                                    ],
                                  ),
                                ),
                                // Deg iii
                                Neumorphic(
                                  margin: EdgeInsets.fromLTRB(
                                      height * 2, height * 2, height * 2, 0),
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.all(height * 1.2),
                                  style: neumorphicStyleProject,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'iii',
                                        style: TextStyle(
                                            fontSize: height * 1.75,
                                            color: Hexcolor('#082AF2'),
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                      ),
                                      SizedBox(
                                        height: width,
                                      ),
                                      AutoSizeText(
                                        "Bm",
                                        style: TextStyle(
                                            fontSize: height * 3.5,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                        group: scaleDegGroup,
                                        maxLines: 1,
                                      )
                                    ],
                                  ),
                                ),
                                // Deg iv
                                Neumorphic(
                                  margin: EdgeInsets.fromLTRB(
                                      height * 2, height * 2, height * 2, 0),
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.all(height * 1.2),
                                  style: neumorphicStyleProject,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'iv',
                                        style: TextStyle(
                                            fontSize: height * 1.75,
                                            color: Hexcolor('#082AF2'),
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                      ),
                                      SizedBox(
                                        height: width,
                                      ),
                                      AutoSizeText(
                                        "C",
                                        style: TextStyle(
                                            fontSize: height * 3.5,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                        group: scaleDegGroup,
                                        maxLines: 1,
                                      )
                                    ],
                                  ),
                                ),
                                // Deg v
                                Neumorphic(
                                  margin: EdgeInsets.fromLTRB(
                                      height * 2, height * 2, height * 2, 0),
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.all(height * 1.2),
                                  style: neumorphicStyleProject,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'v',
                                        style: TextStyle(
                                            fontSize: height * 1.75,
                                            color: Hexcolor('#082AF2'),
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                      ),
                                      SizedBox(
                                        height: width,
                                      ),
                                      AutoSizeText(
                                        "D",
                                        style: TextStyle(
                                            fontSize: height * 3.5,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                        group: scaleDegGroup,
                                        maxLines: 1,
                                      )
                                    ],
                                  ),
                                ),
                                // Deg vi
                                Neumorphic(
                                  margin: EdgeInsets.fromLTRB(
                                      height * 2, height * 2, height * 2, 0),
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.all(height * 1.2),
                                  style: neumorphicStyleProject,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'vi',
                                        style: TextStyle(
                                            fontSize: height * 1.75,
                                            color: Hexcolor('#082AF2'),
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                      ),
                                      SizedBox(
                                        height: width,
                                      ),
                                      AutoSizeText(
                                        "Em",
                                        style: TextStyle(
                                            fontSize: height * 3.5,
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.5),
                                        group: scaleDegGroup,
                                        maxLines: 1,
                                      )
                                    ],
                                  ),
                                ),
                                // Deg vii
                                Neumorphic(
                                  margin: EdgeInsets.fromLTRB(
                                      height * 2, height * 2, height * 2, 0),
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.all(height * 1.2),
                                  style: neumorphicStyleProject,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'vii',
                                          style: TextStyle(
                                              fontSize: height * 1.75,
                                              color: Hexcolor('#082AF2'),
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 1.5),
                                        ),
                                        SizedBox(
                                          height: width,
                                        ),
                                        AutoSizeText(
                                          "Bd",
                                          style: TextStyle(
                                              fontSize: height * 3.5,
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 1.5),
                                          group: scaleDegGroup,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Misc. Chords
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, height),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Neumorphic(
                                    margin: EdgeInsets.fromLTRB(
                                        height * 2, height * 2, height * 2, 0),
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    padding: EdgeInsets.all(height * 1.2),
                                    style: neumorphicStyleProject,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          'Misc. Chords',
                                          style: TextStyle(
                                              fontSize: height * 2,
                                              color: Hexcolor('#082AF2'),
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 1.5),
                                        ),
                                        SizedBox(
                                          height: height,
                                        ),
                                        AutoSizeText(
                                          '''C -> C7\nD -> D7\nShows the chords out of the s s s s   ''',
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
  }
}

