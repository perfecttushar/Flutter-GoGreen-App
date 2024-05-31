import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogreen/components/mydrawer.dart';
import 'package:gogreen/components/myink.dart';
import 'package:gogreen/components/myposter.dart';
import 'package:gogreen/components/mypromo.dart';
import 'package:gogreen/pages/bookingpage.dart';
import 'package:gogreen/pages/dailypasspage.dart';
import 'package:gogreen/pages/faqpage.dart';
import 'package:gogreen/pages/helppage.dart';
import 'package:gogreen/pages/historypage.dart';
import 'package:gogreen/pages/profile_page.dart';
import 'package:gogreen/pages/scanpage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  // open drawer
  //

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  //
  // greetings
  //

  String getGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    // greet
    String greeting = getGreeting();

    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      drawer: const MyDrawer(),

      //
      // body
      //

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              // custom appbar
              //

              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //

                    Image.asset('assets/logo/blazebus.png',
                        height: 45, color: Colors.green.shade600),
                    Row(
                      children: [
                        //

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () =>
                                _scaffoldkey.currentState?.openDrawer(),
                            icon: const Icon(
                              Icons.menu_rounded,
                              size: 20,
                            ),
                          ),
                        ),

                        //

                        const SizedBox(width: 15),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const ProfilePage(),
                              ),
                            ),
                            icon: const Icon(
                              Icons.person,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //
              // greet and image
              //

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting + ' ,',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    //

                    Text(
                      "Hope you're doing well",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              //

              const SizedBox(height: 0),
              Image.asset('assets/images/poster.png'),

              //
              // sugestions
              //

              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //

                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const BookingPage(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      splashColor: Colors.grey.shade200,
                      child: const MyInk(
                        name: 'Book ticket',
                        image: 'assets/icons/book.png',
                      ),
                    ),

                    //

                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Dailpasspage(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      splashColor: Colors.grey.shade200,
                      child: const MyInk(
                        name: 'Daily pass',
                        image: 'assets/icons/mpass.png',
                      ),
                    ),

                    //

                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const FAQPage(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      splashColor: Colors.grey.shade200,
                      child: const MyInk(
                        name: 'FAQ',
                        image: 'assets/icons/faq.png',
                      ),
                    ),
                  ],
                ),
              ),

              //

              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //

                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Historypage(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      splashColor: Colors.grey.shade200,
                      child: const MyInk(
                        name: 'Get history',
                        image: 'assets/icons/history.png',
                      ),
                    ),
                    //

                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => ScanPage(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      splashColor: Colors.grey.shade200,
                      child: const MyInk(
                        name: 'Scan QR',
                        image: 'assets/icons/scanner.png',
                      ),
                    ),

                    //

                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Helppage(),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      splashColor: Colors.grey.shade200,
                      child: const MyInk(
                        name: 'Help Hub',
                        image: 'assets/icons/question.png',
                      ),
                    ),
                  ],
                ),
              ),

              //
              // promocode
              //

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 180,
                  width: double.maxFinite,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const Dailpasspage(),
                            )),
                        child: const MyPromo(
                            color: Color(0xff196B7C),
                            heading:
                                'Daily Pass,\none day key\nto endless fun!',
                            description: 'Get now',
                            image: 'assets/images/promo.png'),
                      ),

                      //

                      const SizedBox(width: 15),

                      //

                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const BookingPage(),
                            )),
                        child: const MyPromo(
                            color: Color(0xff050950),
                            heading:
                                'Stay on track\nride at\nyour booked time!',
                            description: 'Book now',
                            image: 'assets/images/promo2.png'),
                      ),
                    ],
                  ),
                ),
              ),

              //
              // posters
              //

              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enhance your transit",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    //

                    const SizedBox(height: 15),
                    SizedBox(
                      height: 240,
                      width: double.maxFinite,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const MyPoster(
                            image: 'assets/images/gogreen.png',
                            heading: 'Go green',
                            description: 'Green transit ride electric buses',
                          ),

                          //

                          const SizedBox(width: 15),

                          //

                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const Dailpasspage(),
                              ),
                            ),
                            child: const MyPoster(
                              image: 'assets/images/monthlypass.png',
                              heading: 'Daily pass',
                              description: 'Embrace the daily, ride liberated',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //
              //
              //
            ],
          ),
        ),
      ),
    );
  }
}
