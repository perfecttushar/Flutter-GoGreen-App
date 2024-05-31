import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gogreen/authentication/login_or_register.dart';
import 'package:gogreen/pages/home_page.dart';

class AuthenticationGate extends StatelessWidget {
  const AuthenticationGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //
          // logged in
          //

          if (snapshot.hasData) {
            return const HomePage();
          }

          //
          // not logged in
          //
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
