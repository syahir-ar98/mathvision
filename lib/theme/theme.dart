import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathvision_teacher/theme/colors.dart';

final Color alphaVersionColor = Color(0xFF707070);

final ButtonStyle flatButtonActive = TextButton.styleFrom(
  minimumSize: Size(double.infinity, 60.0),
  backgroundColor: primary500,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);

final ButtonStyle flatButtonActive2 = TextButton.styleFrom(
  minimumSize: Size(250, 60.0),
  backgroundColor: primary500,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);

final ButtonStyle tabButtonActive = TextButton.styleFrom(
  minimumSize: Size(double.infinity, 60.0),
  backgroundColor: primary900,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
  ),
);

final ButtonStyle tabButtonNormal = TextButton.styleFrom(
  minimumSize: Size(double.infinity, 60.0),
  backgroundColor: primary500,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
  ),
);

final TextStyle tabButtonTextActive = GoogleFonts.notoSans(
  textStyle: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: gray900,
  ),
);

final TextStyle tabButtonTextNormal = GoogleFonts.notoSans(
  textStyle: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: white,
  ),
);

final ButtonStyle testButtonActive = TextButton.styleFrom(
  minimumSize: Size(243, 60.0),
  backgroundColor: primary500,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);

final ButtonStyle alphaFlatButtonStyle2 = TextButton.styleFrom(
  minimumSize: Size(200.0, 60.0),
  backgroundColor: alphaVersionColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  ),
);

final ButtonStyle alphaFlatButtonStyle2White = OutlinedButton.styleFrom(
  minimumSize: Size(150.0, 60.0),
  side: BorderSide(color: alphaVersionColor),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
);

final ButtonStyle alphaBackButtonStyle = TextButton.styleFrom(
    minimumSize: Size(60.0, 40.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero));

final TextStyle alphaHeading1TextStyle = GoogleFonts.notoSans(
  textStyle: TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: alphaVersionColor,
  ),
);

final TextStyle alphaHeading2TextStyleWhite = GoogleFonts.notoSans(
  textStyle: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: white,
  ),
);

final TextStyle alphaHeading2TextStyleBlack = GoogleFonts.notoSans(
  textStyle: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: gray900,
  ),
);

final TextStyle alphaContent1TextStyle = GoogleFonts.notoSans(
  textStyle: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
    color: alphaVersionColor,
  ),
);

final TextStyle alphaContent2TextStyle = GoogleFonts.notoSans(
  textStyle: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: white,
  ),
);

final BoxDecoration alphaBorder = BoxDecoration(
  border: Border.all(width: 1.0, color: alphaVersionColor),
);

final TextStyle buttonTextWhite = GoogleFonts.notoSans(
    textStyle: TextStyle(
        fontWeight: FontWeight.bold, color: white, fontSize: 16.0));

final TextStyle alphaButtonTextBlack = GoogleFonts.notoSans(
    textStyle: TextStyle(
        fontWeight: FontWeight.bold, color: alphaVersionColor, fontSize: 16.0));

final InputDecoration alphaInputDecoration = InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.zero));
