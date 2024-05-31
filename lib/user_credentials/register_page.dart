// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogreen/components/mytextfield.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  //
  // controllers
  //

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwdcontroller = TextEditingController();

  //
  // toggle page
  //

  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  //
  // register function
  //

  void register(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );

    if (_pwdcontroller.text.isEmpty ||
        _namecontroller.text.isEmpty ||
        _emailcontroller.text.isEmpty) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill up the details',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      try {
        UserCredential? _userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _pwdcontroller.text.trim(),
        );

        await createUserDocument(_userCredential);

        if (context.mounted) Navigator.pop(context);
      } catch (e) {
        Navigator.pop(context);
      }
    }
  }

  //
  // store registered user data
  //

  Future<void> createUserDocument(UserCredential? _userCredential) async {
    if (_userCredential != null && _userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(_namecontroller.text)
          .set({
        'name': _namecontroller.text,
        'email': _emailcontroller.text,
      });

      await _userCredential.user!.updateDisplayName(_namecontroller.text);
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
                    "Let's get,\nYou registered",
                    style: GoogleFonts.poppins(
                        fontSize: 28, fontWeight: FontWeight.w600),
                  ),

                  //
                  // TextField
                  //

                  const SizedBox(height: 20),
                  MyTextfield(
                    hintText: 'Name',
                    obscureText: false,
                    controller: _namecontroller,
                  ),
                  const SizedBox(height: 15),
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
                  // Button
                  //

                  const SizedBox(height: 30),
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
                        Color(0xff2F2E41),
                      ),
                    ),
                    onPressed: () => register(context),
                    child: Text(
                      'Register',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  //
                  // Already  User
                  //

                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a user ? ',
                        style: GoogleFonts.poppins(),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          'Login',
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
