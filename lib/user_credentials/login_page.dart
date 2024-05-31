// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogreen/components/mytextfield.dart';
import 'package:gogreen/user_credentials/forgotpassword_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  //
  // controllers
  //

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwdcontroller = TextEditingController();

  //
  // toggle page
  //

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //
  // login function
  //

  void login(BuildContext context) async {
    if (_emailcontroller.text.isEmpty || _pwdcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill up the details',
            style: GoogleFonts.poppins(),
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      try {
        showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
        );

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _pwdcontroller.text.trim(),
        );

        if (context.mounted) Navigator.pop(context);
      } catch (e) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Invalid email or password',
              style: GoogleFonts.poppins(),
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
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
      // Body
      //

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  // image
                  //

                  SizedBox(height: 80),
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
                    "Hello,\nWelcome back",
                    style: GoogleFonts.poppins(
                        fontSize: 28, fontWeight: FontWeight.w600),
                  ),

                  //
                  // TextField
                  //

                  const SizedBox(height: 20),
                  MyTextfield(
                    hintText: 'Email',
                    obscureText: false,
                    controller: _emailcontroller,
                  ),
                  const SizedBox(height: 15),
                  MyTextfield(
                    hintText: 'Password',
                    obscureText: true,
                    controller: _pwdcontroller,
                  ),

                  //
                  // fotgot password
                  //

                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        ),
                        child: Text(
                          'Forgot Password ?',
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //
                  // Button
                  //
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                        Size(double.maxFinite, 60),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0xff6C63FF),
                      ),
                    ),
                    onPressed: () => login(context),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  //
                  // New User
                  //

                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New User ? ',
                        style: GoogleFonts.poppins(),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  // End
                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
