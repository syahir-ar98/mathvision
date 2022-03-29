import 'dart:html';
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
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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
        decoration: BoxDecoration(color: primary900),
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
                  SizedBox(height: 20.0),
                  getClass(),
                  SizedBox(height: 40.0),
                  Container(
                    width: 150.0,
                    height: 3.0,
                    color: white,
                  ),
                  SizedBox(height: 40.0),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Home',
                      style: tabButtonTextNormal,
                    ),
                    style: tabButtonNormal,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Report',
                      style: tabButtonTextActive,
                    ),
                    style: tabButtonActive,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/test');
                    },
                    child: Text(
                      'Real-time Prediction',
                      style: tabButtonTextNormal,
                    ),
                    style: tabButtonNormal,
                  )
                ],
              ),
            ),
            // Sign Out
            Expanded(
              flex: 1,
              child: Container(
                child: TextButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                    Navigator.pop(context);
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
              ),
            )
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
            child: Center(
          child: Container(
            width: 1024,
            height: 1060,
            child: getReport(),
          ),
        )),
      ),
    );
  }
}
