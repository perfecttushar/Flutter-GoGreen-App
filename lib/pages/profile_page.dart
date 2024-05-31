import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogreen/pages/aboutuspage.dart';
import 'package:gogreen/pages/faqpage.dart';
import 'package:gogreen/pages/helppage.dart';
import 'package:gogreen/pages/historypage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //
  // current logged in user
  //

  late User? _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //
      // appbar
      //

      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),

      //

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            // back button
            //

            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.keyboard_arrow_left_rounded),
                ),
              ),
            ),

            //
            // image
            //

            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 260,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Image.asset('assets/images/profile.png', height: 100),

                      //

                      const SizedBox(height: 30),
                      Text(
                        _currentUser?.displayName ?? '',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      //

                      const SizedBox(height: 5),
                      Text(
                        _currentUser?.email ?? '',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //
            // options
            //

            const SizedBox(height: 20),
            ListTile(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Historypage(),
                  )),
              leading: Ink(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Image.asset('assets/icons/history.png', height: 20),
                ),
              ),
              title: Text(
                'History',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Get your previous booking history.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),

            //

            SizedBox(height: 10),
            ListTile(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => FAQPage(),
                  )),
              leading: Ink(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Image.asset('assets/icons/faq.png', height: 20),
                ),
              ),
              title: Text(
                'FAQ',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Got any questions for us ?',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),

            //
            SizedBox(height: 10),
            ListTile(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Helppage(),
                  )),
              leading: Ink(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Image.asset('assets/icons/question.png', height: 20),
                ),
              ),
              title: Text(
                'Help Hub',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Stucked somewhere feel free to ask',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),

            //

            SizedBox(height: 10),
            ListTile(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Aboutuspage(),
                  )),
              leading: Ink(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Image.asset('assets/icons/about.png', height: 20),
                ),
              ),
              title: Text(
                'About Us',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Want to know more about us ?',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),

            //
            // version
            //

            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'v 1.0.0',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
