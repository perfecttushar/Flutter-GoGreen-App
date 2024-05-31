import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gogreen/authentication/authentication_gate.dart';
import 'package:gogreen/firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //
    // auto rotate off
    //

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationGate(),
    );
  }
}
