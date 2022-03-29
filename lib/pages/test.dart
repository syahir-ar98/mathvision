import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:html';
import 'package:mathvision_teacher/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mathvision_teacher/services/get_class.dart';
import 'package:mathvision_teacher/services/get_id.dart';
import 'package:mathvision_teacher/services/get_image.dart';
import 'package:mathvision_teacher/services/get_name.dart';
import 'package:mathvision_teacher/services/get_report.dart';
import 'package:mathvision_teacher/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathvision_teacher/theme/theme.dart';

class TestingPage extends StatefulWidget {
  @override
  _TestingPageState createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  String text = "-";
  String poor = "-";
  String average = "-";
  String good = "-";
  String textResult = "Not Available";
  String status = "Idle";

  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();
  final TextEditingController input3Controller = TextEditingController();
  final TextEditingController input4Controller = TextEditingController();
  final TextEditingController input5Controller = TextEditingController();
  final TextEditingController input6Controller = TextEditingController();
  final TextEditingController input7Controller = TextEditingController();
  final TextEditingController input8Controller = TextEditingController();
  final TextEditingController input9Controller = TextEditingController();
  final TextEditingController input10Controller = TextEditingController();

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
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/report');
                    },
                    child: Text(
                      'Report',
                      style: tabButtonTextNormal,
                    ),
                    style: tabButtonNormal,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Real-time Prediction',
                      style: tabButtonTextActive,
                    ),
                    style: tabButtonActive,
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
          ),
          child: Row(
            children: [
              // Input Column
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "QUIZ 1 INPUT",
                        style: alphaHeading1TextStyle,
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 2.0,
                        color: Colors.black38,
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          // Left Column Input
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: input1Controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Question 1 Score (1 or 0)",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primary500, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: input2Controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Question 2 Score (1 or 0)",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primary500, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: input3Controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Question 3 Score (1 or 0)",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primary500, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: input4Controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Question 4 Score (1 or 0)",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primary500, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: input5Controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Question 5 Score (1 or 0)",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primary500, width: 2.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 45.0),
                          // Right Column Input
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                TextField(
                                  controller: input6Controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Question 1 Time (s)",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primary500, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: input7Controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Question 2 Time (s)",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primary500, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: input8Controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Question 3 Time (s)",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primary500, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: input9Controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Question 4 Time (s)",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primary500, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: input10Controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Question 5 Time (s)",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primary500, width: 2.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 2.0,
                        color: Colors.black38,
                      ),
                      SizedBox(height: 15.0),
                      // Test Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // POST Button
                          Expanded(
                            child: TextButton(
                                onPressed: () async {
                                  debugPrint(
                                      "input1: ${input1Controller.text}");
                                  final sendQuery = await http.post(
                                    Uri.parse(
                                        'https://syahir-model.herokuapp.com/'),
                                    headers: {
                                      'Content-type': 'application/json',
                                      "Access-Control_Allow_Origin": "*"
                                    },
                                    body: json.encode({
                                      'input1': input1Controller.text,
                                      'input2': input2Controller.text,
                                      'input3': input3Controller.text,
                                      'input4': input4Controller.text,
                                      'input5': input5Controller.text,
                                      'input6': input6Controller.text,
                                      'input7': input7Controller.text,
                                      'input8': input8Controller.text,
                                      'input9': input9Controller.text,
                                      'input10': input10Controller.text,
                                    }),
                                  );
                                  setState(() {
                                    if (sendQuery.statusCode == 200) {
                                      status = "POST Success";
                                    } else {
                                      status = "Something went wrong!";
                                    }
                                  });
                                  debugPrint(
                                      "sendQuery: ${sendQuery.statusCode}");
                                },
                                child: Text(
                                  'SEND INPUT',
                                  style: GoogleFonts.notoSans(
                                      textStyle: buttonTextWhite),
                                ),
                                style: testButtonActive),
                          ),
                          SizedBox(width: 45.0),
                          // GET Button
                          Expanded(
                            child: TextButton(
                              onPressed: () async {
                                final receiveResponse = await http.get(
                                  Uri.parse(
                                      'https://syahir-model.herokuapp.com/'),
                                  headers: {
                                    'Content-type': 'application/json',
                                    "Access-Control_Allow_Origin": "*"
                                  },
                                );
                                final decode =
                                    json.decode(receiveResponse.body);
                                debugPrint("decode: $decode");
                                debugPrint(
                                    "result: ${decode['Results']['output1'][0]['Scored Labels']}");
                                final poorProbabilities = decode['Results']
                                        ['output1'][0]
                                    ['Scored Probabilities for Class "POOR"'];
                                final averageProbabilities = decode['Results']
                                        ['output1'][0][
                                    'Scored Probabilities for Class "AVERAGE"'];
                                final goodProbabilities = decode['Results']
                                        ['output1'][0]
                                    ['Scored Probabilities for Class "GOOD"'];
                                final overallResult = decode['Results']
                                    ['output1'][0]['Scored Labels'];

                                poor = (double.parse(poorProbabilities) * 100)
                                    .toStringAsFixed(0);
                                average =
                                    (double.parse(averageProbabilities) * 100)
                                        .toStringAsFixed(0);
                                good = (double.parse(goodProbabilities) * 100)
                                    .toStringAsFixed(0);

                                if (overallResult == 'GOOD') {
                                  textResult = "Good";
                                } else if (overallResult == 'AVERAGE') {
                                  textResult = "Average";
                                } else if (overallResult == 'POOR') {
                                  textResult = "Poor";
                                }

                                debugPrint(
                                    "statusCode: ${receiveResponse.statusCode}");

                                setState(() {
                                  if (receiveResponse.statusCode == 200) {
                                    status = "GET Success";
                                  } else {
                                    status = "Something went wrong!";
                                  }
                                  text = textResult;
                                  debugPrint("final result: $text");
                                });
                              },
                              child: Text("GET RESULT",
                                  style: GoogleFonts.notoSans(
                                      textStyle: buttonTextWhite)),
                              style: testButtonActive,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      // Status Code
                      Container(
                        width: double.infinity,
                        height: 30,
                        child: Center(child: Text("STATUS: $status")),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.black54),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Divider
              SizedBox(width: 50),
              // Result Column
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "QUIZ 2 GRADE PREDICTION",
                        style: alphaHeading1TextStyle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 2.0,
                        color: Colors.black38,
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(30),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Result:',
                                      style: alphaHeading2TextStyleBlack,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      text,
                                      style: alphaContent1TextStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 2.0,
                                color: Colors.black38,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Grade Prediction Probabilities',
                                style: alphaHeading2TextStyleBlack,
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey[100],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Text(
                                              'POOR',
                                              style: alphaButtonTextBlack,
                                            ),
                                            Expanded(
                                              child: Center(
                                                  child: Text(
                                                "$poor%",
                                                style:
                                                    alphaHeading2TextStyleBlack,
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey[100],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Text(
                                              'AVERAGE',
                                              style: alphaButtonTextBlack,
                                            ),
                                            Expanded(
                                              child: Center(
                                                  child: Text(
                                                "$average%",
                                                style:
                                                    alphaHeading2TextStyleBlack,
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey[100],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Text(
                                              'GOOD',
                                              style: alphaButtonTextBlack,
                                            ),
                                            Expanded(
                                              child: Center(
                                                  child: Text(
                                                "$good%",
                                                style:
                                                    alphaHeading2TextStyleBlack,
                                              )),
                                            )
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
}
