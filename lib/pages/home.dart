import 'dart:html';
import 'dart:ui';
import 'package:mathvision_teacher/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mathvision_teacher/services/get_class.dart';
import 'package:mathvision_teacher/services/get_id.dart';
import 'package:mathvision_teacher/services/get_image.dart';
import 'package:mathvision_teacher/services/get_name.dart';
import 'package:mathvision_teacher/services/get_report.dart';
import 'package:mathvision_teacher/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathvision_teacher/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';
import '../theme/theme.dart';
import '../theme/theme.dart';

const _url =
    'https://ml.azure.com/endpoints/lists/realtimeendpoints/model-decisiontree/test?wsid=/subscriptions/ebcdea7a-6271-4503-8823-56d588c1e1d9/resourcegroups/syahir-fyp/workspaces/syahir-fyp-ml&tid=ddabcb0f-72ff-4608-afd2-0ded5fab1e32';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Widget getName() {
    final User user = auth.currentUser;
    final uid = user.uid;

    if (GetTeacherName(uid) == null) {
      return Text("NONE");
    } else {
      return GetTeacherName(uid);
    }
  }

  Widget getID() {
    final User user = auth.currentUser;
    final uid = user.uid;

    if (GetID(uid) == null) {
      return Text("NONE");
    } else {
      return GetID(uid);
    }
  }

  Widget getClass() {
    final User user = auth.currentUser;
    final uid = user.uid;

    if (GetClass(uid) == null) {
      return Text("NONE");
    } else {
      return GetClass(uid);
    }
  }

  Widget getReport() {
    final User user = auth.currentUser;
    final uid = user.uid;

    if (GetReport(uid) == null) {
      return Text("NONE");
    } else {
      return GetReport(uid);
    }
  }

  Widget getImage() {
    final User user = auth.currentUser;
    final uid = user.uid;

    if (GetImage(uid) == null) {
      return Text("NONE");
    } else {
      return GetImage(uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: primary500.withOpacity(0.1)),
        child: Row(
          children: [
            _buildLeftPanel(),
            _buildRightPanel(),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftPanel() {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: primary500,
          boxShadow: [
            BoxShadow(
              color: gray400.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Column(
                children: [
                  SizedBox(height: 50.0),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.0, color: white)),
                    child: ClipOval(child: getImage()),
                  ),
                  SizedBox(height: 20.0),
                  getName(),
                  getID(),
                  SizedBox(height: 40.0),
                  Container(
                    width: 150.0,
                    height: 3.0,
                    color: white,
                  ),
                  SizedBox(height: 40.0),
                  getClass(),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      context.read<AuthenticationService>().signOut();
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 60.0),
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text(
                      'SIGN OUT',
                      style: GoogleFonts.notoSans(textStyle: buttonTextWhite),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildRightPanel() {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.all(50),
        child: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: alphaVersionColor),
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: [
              // Left Column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "WELCOME TO",
                      style: GoogleFonts.barlowSemiCondensed(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 90.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("lib/assets/home-icon.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 2.0,
                      width: 150.0,
                      color: primary500,
                    ),
                    SizedBox(height: 40.0),
                    RichText(
                      text: TextSpan(
                        text:
                            'A Mathematics Performance Monitoring System Using',
                        style: GoogleFonts.barlowSemiCondensed(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 28.0,
                              color: gray800),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Data Analytics',
                            style: GoogleFonts.barlowSemiCondensed(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28.0,
                                  color: primary500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(
                            "All features and functionality of the system is still in development phase.You may experience some bugs and glitches.",
                            style: GoogleFonts.barlowSemiCondensed(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("lib/assets/footer.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              // Divider
              SizedBox(width: 50),
              // Right Column
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Demo: Analysis for Quiz 1",
                        style: GoogleFonts.barlowSemiCondensed(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 32.0),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 2.0,
                        width: 150.0,
                        color: primary500,
                      ),
                      SizedBox(height: 40.0),
                      RichText(
                        text: TextSpan(
                          text: '1. View Report',
                          style: GoogleFonts.barlowSemiCondensed(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                                color: gray800),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "\nView analysis of Quiz 1 using Power BI visualization.",
                              style: GoogleFonts.barlowSemiCondensed(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    color: gray800),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/report');
                        },
                        child: Text(
                          "VIEW REPORT",
                          style: buttonTextWhite,
                        ),
                        style: flatButtonActive2,
                      ),
                      SizedBox(height: 40.0),
                      RichText(
                        text: TextSpan(
                          text: '2. Real-time Prediction',
                          style: GoogleFonts.barlowSemiCondensed(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                                color: gray800),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "\nUses real-time prediction analysis to predict student's grade for Quiz 2 based on Quiz 1 performance.",
                              style: GoogleFonts.barlowSemiCondensed(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    color: gray800),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/test');
                        },
                        child: Text(
                          "REAL-TIME PREDICTION",
                          style: buttonTextWhite,
                        ),
                        style: flatButtonActive2,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
