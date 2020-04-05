import 'package:chordbooksimplified/model/scale_major.dart';
import 'package:chordbooksimplified/model/scale_minor.dart';
import 'package:chordbooksimplified/model/song.dart';

class Data {
  static String dim = String.fromCharCode(119212);
  static String sharp = String.fromCharCode(9839);
  static String flat = String.fromCharCode(9837);

  Map _minorScale = {
    'C': ScaleMinor(
        i: 'Cm',
        ii: 'D$dim',
        iii: 'E$flat',
        iv: 'Fm',
        v: 'Gm',
        vi: 'A$flat',
        vii: 'B$flat'),
    'D': ScaleMinor(
        i: 'Dm',
        ii: 'E$dim',
        iii: 'F',
        iv: 'Gm',
        v: 'Am',
        vi: 'B$flat',
        vii: 'C'),
    'E': ScaleMinor(
        i: 'Em',
        ii: 'F$sharp$dim',
        iii: 'G',
        iv: 'Am',
        v: 'Bm',
        vi: 'C',
        vii: 'D'),
    'F': ScaleMinor(
        i: 'Fm',
        ii: 'G$dim',
        iii: 'A$flat',
        iv: 'B$flat' 'm',
        v: 'Cm',
        vi: 'D$flat',
        vii: 'E$flat'),
    'G': ScaleMinor(
        i: 'Gm',
        ii: 'A$dim',
        iii: 'B$flat',
        iv: 'Cm',
        v: 'Dm',
        vi: 'E$flat',
        vii: 'F'),
    'A': ScaleMinor(
        i: 'Am', ii: 'B$dim', iii: 'C', iv: 'Dm', v: 'Em', vi: 'F', vii: 'G'),
    'B': ScaleMinor(
        i: 'Bm',
        ii: 'C$sharp$dim',
        iii: 'D',
        iv: 'Em',
        v: 'F$sharp' 'm',
        vi: 'G',
        vii: 'A'),
  };

  Map _majorScale = {
    'C': ScaleMajor(
        i: 'C', ii: 'Dm', iii: 'Em', iv: 'F', v: 'G', vi: 'Am', vii: 'B$dim'),
    'D': ScaleMajor(
        i: 'D',
        ii: 'Em',
        iii: 'F$sharp' 'm',
        iv: 'G',
        v: 'A',
        vi: 'Bm',
        vii: 'C$sharp$dim'),
    'E': ScaleMajor(
        i: 'E',
        ii: 'F$sharp' 'm',
        iii: 'G$sharp' 'm',
        iv: 'A',
        v: 'B',
        vi: 'C$sharp' 'm',
        vii: 'D$sharp$dim'),
    'F': ScaleMajor(
        i: 'F',
        ii: 'Gm',
        iii: 'Am',
        iv: 'B$flat',
        v: 'C',
        vi: 'Dm',
        vii: 'E$dim'),
    'G': ScaleMajor(
        i: 'G',
        ii: 'Am',
        iii: 'Bm',
        iv: 'C',
        v: 'D',
        vi: 'Em',
        vii: 'F$sharp$dim'),
    'A': ScaleMajor(
        i: 'A',
        ii: 'Bm',
        iii: 'C$sharp' 'm',
        iv: 'D',
        v: 'E',
        vi: 'F$sharp' 'm',
        vii: 'G$sharp$dim'),
    'B': ScaleMajor(
        i: 'B',
        ii: 'C$sharp' 'm',
        iii: 'D$sharp' 'm',
        iv: 'E',
        v: 'F$sharp',
        vi: 'G$sharp' 'm',
        vii: 'A$sharp$dim'),
  };

  Map songs = {
    '1': Song(
        book: 'Songs of Zion',
        number: '1',
        name: 'Holy Holy Holy',
        scale: 'D',
        rhythm: '4/4',
        misc: 'non'),
    '2': Song(
        book: 'Songs of Zion',
        number: '2',
        name: 'He leadeth me',
        scale: 'C',
        rhythm: '2/4',
        misc: 'non'),
    '3': Song(
        book: 'Songs of Zion',
        number: '3',
        name: 'Amazing Grace',
        scale: 'G',
        rhythm: '3/8',
        misc: 'non'),
    '4': Song(
        book: 'Songs of Zion',
        number: '4',
        name: 'Blessed Assurance',
        scale: 'E',
        rhythm: '3/4',
        misc: 'non'),
    '5': Song(
        book: 'Songs of Zion',
        number: '5',
        name: 'Trust in You',
        scale: 'A',
        rhythm: '2/4',
        misc: 'non'),
  };
}

//𝆬	Combining Harmonic	U + 1D1AC;	&#119212;
//♯	Sharp Sign	U + 266F;	&#9839;
//♭	Flat Sign	U + 266D;	&#9837;
