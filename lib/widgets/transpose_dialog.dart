import 'package:chordbooksimplified/model/song.dart';
import 'package:chordbooksimplified/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransposeDialog extends StatefulWidget {
  final Song song;

  TransposeDialog({this.song});

  @override
  _TransposeDialogState createState() => _TransposeDialogState(song);
}

class _TransposeDialogState extends State<TransposeDialog> {
  _TransposeDialogState(this.song);

  Song song;

  transButton(bool plus) {
    setState(() {
      if (plus)
        song.transpose++;
      else
        song.transpose--;
      if (song.transpose == 13 || song.transpose == -13) song.transpose = 0;
    });
  }

  dialogContent(BuildContext context, Song song) {
    SizeConfig().init(context);
    double width = SizeConfig.safeBlockHorizontal;
    double height = SizeConfig.safeBlockVertical;

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                'Transpose: ' + song.transpose.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "All Scales",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(song); // To close the dialog
                  },
                  child: Text('Okay'),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MaterialButton(
              padding: EdgeInsets.only(top: height * 8),
              child: Text(
                '-',
                style: TextStyle(
                    fontSize: height * 6,
                    color: Colors.indigo[700],
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5),
              ),
              onPressed: () => transButton(false),
            ),
            CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: Consts.avatarRadius,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'D#',
                      style: TextStyle(
                          fontSize: height * 7,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.5),
                    ),
                    Text(
                      ' maj',
                      style: TextStyle(
                          fontSize: height * 2,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.5),
                    ),
                  ],
                )),
            MaterialButton(
              padding: EdgeInsets.only(top: height * 8),
              child: Text(
                '+',
                style: TextStyle(
                    fontSize: height * 5,
                    color: Colors.indigo[700],
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5),
              ),
              onPressed: () => transButton(true),
            ),
          ],
        )
        //...bottom card part,
        //...top circlular image part,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, song),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
