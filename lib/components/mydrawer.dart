import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogreen/pages/helppage.dart';
import 'package:gogreen/pages/profile_page.dart';
import 'package:gogreen/pages/scanpage.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //
  // log out
  //

  void logout() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //
          // logo
          //

          const SizedBox(height: 120),
          Image.asset(
            'assets/logo/blazebus.png',
            height: 80,
            color: Colors.grey.shade800,
          ),

          //

          const SizedBox(height: 15),
          Text(
            'G O G R E E N',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.grey.shade800,
            ),
          ),

          //
          // options
          //

          const SizedBox(height: 80),
          ListTile(
            onTap: () => Navigator.pop(context),
            leading: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Image.asset('assets/icons/home.png', height: 20),
              ),
            ),
            title: Text(
              'Home',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Go back to home',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ),

          //

          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
            leading: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Image.asset('assets/icons/profile.png', height: 20),
              ),
            ),
            title: Text(
              'Profile',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'History, FAQ, Help, etc',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ),

          //

          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ScanPage(),
                ),
              );
            },
            leading: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Image.asset('assets/icons/scanner.png', height: 20),
              ),
            ),
            title: Text(
              'Scan Qr Code',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Generated QR Scan',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ),

          //

          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Helppage(),
                ),
              );
            },
            leading: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Image.asset('assets/icons/question.png', height: 20),
              ),
            ),
            title: Text(
              'Help Hub',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Get your query solved',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ),

          //
          // log out
          //

          const SizedBox(height: 40),
          ListTile(
            onTap: () {
              logout();
              Navigator.pop(context);
            },
            leading: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Image.asset('assets/icons/logout.png', height: 20),
              ),
            ),
            title: Text(
              'Log Out',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Exit GoGreen',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ),

          //
          // copyright
          //

          const SizedBox(height: 80),
          Center(
            child: Text(
              '© 2024 GoGreen. All Rights Reserved.',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
