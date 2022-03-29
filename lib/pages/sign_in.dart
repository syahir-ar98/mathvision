import 'package:mathvision_teacher/theme/colors.dart';
import 'package:mathvision_teacher/theme/theme.dart';
import 'package:mathvision_teacher/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/sign-in-bg3.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Header
          Container(
            padding: EdgeInsets.only(left: 160.0, top: 100.0, right: 160.0),
            child: Text(
              'Version: Alpha 1.6',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          // Content
          Container(
            padding: EdgeInsets.all(160.0),
            child: Row(
              children: [
                _buildLeftPanel(),
                Flexible(flex: 1, child: Container()), // Divider
                _buildRightPanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftPanel() {
    return Expanded(
      flex: 4,
      // Wrapper
      child: Container(
        padding: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: gray400.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Part
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Back Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Title
                      Container(
                        child: Text('SIGN IN', style: alphaHeading1TextStyle),
                      ),
                    ],
                  ),

                  // Whitespace
                  SizedBox(height: 40.0),

                  // Divider
                  Container(
                    height: 4.0,
                    width: 60.0,
                    color: alphaVersionColor,
                  ),
                ],
              ),
            ),

            // Bottom Part
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email Input
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      labelText: "Email",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary500, width: 2.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  // Password Input
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      labelText: "Password",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary500, width: 2.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.0),

                  // Sign In Button
                  TextButton(
                    onPressed: () {
                      context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                    },
                    child: Text("SIGN IN",
                        textAlign: TextAlign.center,
                        style:
                            GoogleFonts.notoSans(textStyle: buttonTextWhite)),
                    style: flatButtonActive,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRightPanel() {
    return Expanded(
      flex: 4,
      child: Container(
        padding: EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.transparent),
        ),
      ),
    );
  }
}
