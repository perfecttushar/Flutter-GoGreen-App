// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogreen/components/mytextfield.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  //
  // controller
  //

  final TextEditingController _forgotpasswordController =
      TextEditingController();

  //
  // password reset function
  //

  void passwordReset() async {
    if (_forgotpasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter the email',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _forgotpasswordController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Password Reset Link Sent !',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Invalid email',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _forgotpasswordController.dispose();
    super.dispose();
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //
      // app bar
      //

      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      //
      // body
      //

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                // back button
                //

                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.keyboard_arrow_left_rounded),
                  ),
                ),
                //
                // image
                //

                SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      Image.asset('assets/logo/blazebus.png',
                          height: 80, color: Colors.grey.shade800),

                      //

                      SizedBox(height: 10),
                      Text(
                        "G O G R E E N",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                ),

                //
                // Text
                //

                const SizedBox(height: 80),
                Text(
                  "Forgot\nyour password ?",
                  style: GoogleFonts.poppins(
                      fontSize: 28, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Text(
                  'Enter your email address, You will recieve a link to create a new password via email. Make ensure to enter valid email address.',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),

                //
                // Textfield & Forgot Password
                //

                const SizedBox(height: 30),
                MyTextfield(
                  hintText: 'Email',
                  obscureText: false,
                  controller: _forgotpasswordController,
                ),

                //
                // Sign in Button
                //

                const SizedBox(height: 20),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xff2F2E41),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    minimumSize: MaterialStatePropertyAll(
                      Size(double.maxFinite, 60),
                    ),
                  ),
                  onPressed: () => passwordReset(),
                  child: Text(
                    'Reset Password',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
